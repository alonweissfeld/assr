import sys
import numpy as np
from scipy.io.wavfile import write

SPS = 44100     # Samples per second
RANGE = 32767   # Signed short int ranges from -32768 to +32767
WAV_DIR = './stimuli'
ATTENUATION_FACTOR = 0.5


def generate(stimulus):
    """
    For a given frequency (cycles per second) and duration in seconds,
    generates a simple sine wave and saves it to disk.
    """
    freq = stimulus.get('frequency')
    duration = stimulus.get('duration')

    samples = np.arange(duration * SPS)
    interval = (2 * np.pi * freq) / SPS

    # Sample discrete sine values at each interval.
    waveform = np.sin(interval * samples)

    # Apply decrease in volume targets in the waveform
    targets = stimulus.get('targets')
    create_targets(waveform, targets)

    # Convert to sign 16-bit integers and attenuate the loud signal
    waveform = np.int16(waveform * ATTENUATION_FACTOR * RANGE)

    length = len(targets.get('timings'))
    filepath = '{}/{}Hz_{}s_{}targets.wav'.format(WAV_DIR, freq, duration, length)
    write(filepath, SPS, waveform)

def create_targets(waveform, targets):
    """
    Modifies the waveform to create targets (decrease in volume) by attenuating
    it to perc * amplitude at the given targets timings (given in seconds).
    """
    timings = targets.get('timings')
    duration = targets.get('duration')
    percentage = targets.get('percentage')

    for time in timings:
        idx = time * SPS
        waveform[idx:idx + int(SPS * duration)] *= percentage

if __name__ == "__main__":
    stimulus = {
        'frequency': 500,
        'duration': 10,
        'targets': {
            'timings': [1, 4, 7],
            'duration': 0.5,
            'percentage': 0.6
        }
    }

    generate(stimulus)

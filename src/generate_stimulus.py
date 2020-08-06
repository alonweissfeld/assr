import sys
import numpy as np
from scipy import signal
from scipy.io.wavfile import write

SPS = 44100     # Samples per second
RANGE = 32767   # Signed short int ranges from -32768 to +32767
WAV_DIR = './stimuli'
STEADY_STATE_FREQ = 40
ATTENUATION_FACTOR = 0.6


def generate_steadystate(duration):
    """Generates the steady state modulation using a simple squre wave"""
    samples = np.arange(duration * SPS)
    interval = (2 * np.pi * STEADY_STATE_FREQ) / SPS

    # Sample discrete sqaure values at each interval
    # and normalize it to the [0,1] range.
    sqaureWave = signal.square(interval * samples)
    return 0.5 * sqaureWave + 0.5


def generate_carrier(freq, duration, targets):
    """Generates the carrier sine signal with specified targets"""
    samples = np.arange(duration * SPS)
    interval = (2 * np.pi * freq) / SPS

    # Sample discrete sine values at each interval.
    waveform = np.sin(interval * samples)

    # Apply decrease in volume targets in the waveform
    create_targets(waveform, targets)

    return waveform


def generate(stimulus):
    """
    Generates an ASSR stimulus composed from a modulated carrier signal.
    The modulation signal is usually around 30-50Hz as ti vibrates
    the higher carrier frequeny, which is around the 500-600Hz.
    """
    freq = stimulus.get('frequency')
    targets = stimulus.get('targets')
    duration = stimulus.get('duration')

    steadystate = generate_steadystate(duration)
    carrier = generate_carrier(freq, duration, targets)

    # Apply the modulation (steady state frequeny) on the carrier sine
    waveform = np.multiply(carrier, steadystate)

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
        'duration': 5,
        'targets': {
            'timings': [1, 3],
            'duration': 0.3,
            'percentage': 0.5
        }
    }

    generate(stimulus)

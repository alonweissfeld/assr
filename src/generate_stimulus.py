import sys
import numpy as np
from scipy.io.wavfile import write

SPS = 44100     # Samples per second
RANGE = 32767   # Signed short int ranges from -32768 to +32767
WAV_DIR = './stimuli'
ATTENUATION_FACTOR = 0.5


def generate(freq, duration):
    """
    For a given frequency (cycles per second) and duration in seconds,
    generates a simple sine wave and saves it to disk.
    """
    samples = np.arange(duration * SPS)
    interval = (2 * np.pi * freq) / SPS

    # Sample discrete sine values at each interval.
    waveform = np.sin(interval * samples)

    # Convert to sign 16-bit integers and attenuate the loud signal
    waveform = np.int16(waveform * ATTENUATION_FACTOR * RANGE)
    filepath = '{}/{}Hz_{}seconds.wav'.format(WAV_DIR, freq, duration)
    write(filepath, SPS, waveform)

if __name__ == "__main__":
    args = sys.argv
    freq = float(args[1])
    duration = float(args[2])

    generate(freq, duration)

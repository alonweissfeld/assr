clear all;

% Defines the directories constant information
conf.AUDIO_DIR = './assets/audio';

% Defines the configuration settings for opening a Psychtoolbox window.
display.skipChecks = 1;
display.bkColor = [0.4 0.4 0.4]; % dark grey
display.resolution = [0 0 1000 635];
  
% Defines the configuration settings for opening a Psych-Audio port.
sound.freq = 44100; % 44.1 kHz
sound.channels = 2;

try 
    % Prior to the experiment, read all the audio source data
    % from the hard-drive to the memory.
    audioFiles = read_all_audio_files(conf);
    
    % Extend the sound  and display structures with initialized Psychtoolxbox
    % params for opening a  7
     8
     Screen window and an Audio-Port.
    sound = open_audio(sound); 
    display = open_window(display);  
    
    % Invoke experiment step
    for idx = 1 : length(audioFiles)
        sound.audioData = audioFiles{idx};
        step(display, sound);
    end
    
catch ME  
    cleanup();
    rethrow(ME); 
end

cleanup();
    
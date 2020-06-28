clear all;

% Defines the configuration settings for opening a Psychtoolbox window.
display.skipChecks = 1;
display.bkColor = 0;
display.resolution = [0 0 1000 635];

% Defines the configuration settings for opening a Psych-Audio port.
sound.freq = 44100; % 44.1 kHz
sound.channels = 2;

try
    sound = open_audio(sound);
    display = open_window(display);   
      
    step(display.windowPtr, sound. pahandle);
catch ME
    Screen('CloseAll');
    PsychPortAudio('Close');
    rethrow(ME);
end

Screen('CloseAll');
PsychPortAudio('Close');
    
clear all;

% Defines the configuration settings for opening a Psychtoolbox window.
display.skipChecks = 1;
display.bkColor = [0.4 0.4 0.4]; % dark grey
display.resolution = [0 0 1000 635];
  
% Defines the configuration settings for opening a Psych-Audio port.
sound.freq = 44100; % 44.1 kHz
sound.channels = 2;


try 
    % Extend the sound  and display structures with initialized Psychtoolxbox
    % params for opening a Screen window and an Audio-Port.
    sound = open_audio(sound); 
    display = open_window(display);   
      
    step(display, sound);
    
catch ME  
    cleanup();
    
    %   ple;
    rethrow(ME); 
end

cleanup();
    
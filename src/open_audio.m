% Initiates any audio related configurations.
function sound = open_audio(params)
    PsychPortAudio('Close'); % Prev sound channels.
        
    % Flag set to one to push really hard for low latency.
    InitializePsychSound(1);
    
    % Open up a sound channel (Psych-Audio port).
        % (1) [] = default sound device
        % (2) 1 = sound playback only
        % (3) 1 = default level of latency
        % (4) Requested frequency in samples per second
        % (5) 2 = stereo output
    pahandle = PsychPortAudio('Open', [], 1, 1, params.freq, params.channels); 
 
    sound = params;
    sound.pahandle = pahandle;
end


function play_audio(pahandle)
    PsychPortAudio('Start', pahandle);
    PsychPortAudio('Stop', pahandle, 1); % Waits until sound ends.
end
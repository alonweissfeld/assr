function play_audio(pahandle, src)
    % Note: we can use the first two lines of code to load the sound
    % file and add it to the buffer before the experiment starts.
    
    % Read the file from hard drive
    [data, Fs] = audioread(src);
    
    % Queues up sound in the sound card by putting it in
    % the sound card's "buffer."
    PsychPortAudio('FillBuffer', pahandle, data');
   
    PsychPortAudio('Start', pahandle);
    PsychPortAudio('Stop', pahandle, 1); % Waits until sound ends.
end
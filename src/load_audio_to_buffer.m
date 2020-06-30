function load_audio_to_buffer(sound)
    % Queues up sound in the sound card by putting it in
    % the sound card's "buffer."
    PsychPortAudio('FillBuffer', sound.pahandle, sound.audioData');
end
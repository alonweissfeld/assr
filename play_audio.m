function play_audio(src)
    [y, Fs] = audioread(src);
    sound(y, Fs);
    clear sound;
end
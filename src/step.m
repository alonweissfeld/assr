%{
    Specifies a single step of the experiment.
    A step would be either auditory stimuli (external-axes)
    or heart beats count (internal-axes), which is determine
    by 'type'.
    @param type - indicates whether this stp is internal or external
    @param audioFile - indicates the path to the audio file
    @param windowPointer - indicates the current window pointer
%}
function step(display, sound)
    % Load the curent audio to buffer
    load_audio_to_buffer(sound);

    % instruction step - wait for spacebar
    dialog_textmessage(display, 'Listen inside', Inf, KbName('space'));
    
    % screen becomes black for 2 seconds
    black_screen_wait(display, 2);

    % Play audio
    play_audio(sound.pahandle);
    % (send to diodes?)

    % after x ms, show the sign to begein count.
    % (x is the time for the steady state to stabilize)
    
    % Results screen
    result = get_number_input(display, 'Enter result: ');
    
    % Empty the audio buffer
    empty_audio_from_buffer();
end
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
    % display_image('./assets/img/heart.jpg', windowPtr);
  
    % instruction step - wait for spacebar
    dialog_textmessage(display, 'Listen inside', Inf, KbName('space'));
    
    % screen becomes black for 2 seconds
    black_screen_wait(display, 2);

    % Show sign to start counting

    % start of audio
    play_audio(sound.pahandle, './assets/audio/volume-7.mp3');
    % (send to diodes?)

    % after x ms, show the sign to begein count.
    % (x is the time for the steady state to stabilize)
    
    % Results screen
    result = get_number_input(display, 'Enter result: ');
end
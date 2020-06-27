%{
    Specifies a single step of the experiment.
    A step would be either auditory stimuli (external-axes)
    or heart beats count (internal-axes), which is determine
    by 'type'.
    @param type - indicates whether this stp is internal or external
    @param audioFile - indicates the path to the audio file
    @param windowPointer - indicates the current window pointer
%}
function step(windowPtr)
    
    % display_image('img/heart.jpg', windowPtr);
    
    color = [0.4 0.4 0.4]; % darkGrey1
  
    % instruction step - wait for spacebar
    dialog_textmessage(windowPtr, 'Listen inside', color, Inf, KbName('space'));
    
    % screen becomes black
    black_screen();
    
    % delay of ~2sec
    WaitSecs(2);

    % start of audio
    play_audio('volume-7.mp3');
    % (send to diodes?)

    % after x ms, show the sign to begein count.
    % (x is the time for the steady state to stabilize)
    
    % Enter results screen.
    
    % Clear the screen
    % sca;
    Screen('CloseAll');
end
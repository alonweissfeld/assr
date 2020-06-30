% Sets the screen to black and waits a given specific time in seconds.
function black_screen_wait(display, waitingTime)
    % Default "rect" is entire window.
    Screen('FillRect', display.windowPtr, [0 0 0]);    
    Screen('Flip', display.windowPtr);
    WaitSecs(waitingTime);
end
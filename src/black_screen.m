%{ 
Sets the screen to black.
%}
function black_screen(windowPtr)
    Screen('FillRect', windowPtr, [0 0 0]);
    Screen('Flip', windowPtr);
end
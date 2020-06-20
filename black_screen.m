%{ 
Sets the screen to black.
%}
function black_screen(windowPointer)
    Screen('FillRect', windowPointer, [0 0 0]);
    Screen('Flip', windowPointer); % Why?
end
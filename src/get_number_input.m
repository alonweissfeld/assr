% Returns a number entered by the user.
function result = get_number_input(display, msg)
    center = display.center;
    bkColor = display.bkColor;
    textColor = bkColor*255;
    windowPtr = display.windowPtr;
    
    indent = ((display.textSize / 2) * strlength(msg)) / 2;
    result = GetEchoNumber(windowPtr, msg, center(1) - indent, center(2), textColor, bkColor);
    Screen('Flip', windowPtr);
end
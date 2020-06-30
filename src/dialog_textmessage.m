function aborted = dialog_textmessage(display, textMessage, waitingTime, varargin)
    windowPtr = display.windowPtr;
    bkColor = display.bkColor;
    
    draw_message_text(windowPtr, textMessage, bkColor*255)
    aborted = wait_keypress(waitingTime, varargin{1});
end
function draw_message_text(windowPtr, text, color)
    DrawFormattedText(windowPtr, text, 'center', 'center', color);
    Screen('Flip', windowPtr);
end
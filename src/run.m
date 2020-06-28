% Defines the initial settings for opening a Psychtoolbox window.
display.skipChecks = 1;
display.bkColor = 0;

try
    display = open_window(display);
    step(display.windowPtr);
catch ME
     Screen('CloseAll');
     rethrow(ME);
end
Screen('CloseAll');
    
function display = open_window(params)
    % NOTE: Stop screen from being synced. Shuld be 0 for real experiment.
    Screen('Preference', 'SkipSyncTests', params.skipChecks);
    
    % Initialize fullscreen
    [windowPtr, windowRect] = Screen('OpenWindow', 0, params.bkColor, params.resolution, [], 2);
    Priority(MaxPriority(windowPtr));
    
    % Set up alpha-blending for smooth (anti-aliased) lines
    Screen('BlendFunction', windowPtr, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
    
    [xCenter, yCenter] = RectCenter(windowRect);
    textSize = Screen('TextSize', windowPtr);
    
    display = params;
    display.center = [xCenter, yCenter];
    display.textSize = textSize;
    display.windowPtr = windowPtr;
end
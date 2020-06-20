% NOTE: Stop screen from being synced. Shuld be 0 for real experiment.
Screen('Preference', 'SkipSyncTests', 1);

% Initialize fullscreen
[windowPointer, windowRectangle] = Screen('OpenWindow', 0, 0, [], [], 2);
Priority(MaxPriority(windowPointer));

% Set up alpha-blending for smooth (anti-aliased) lines
Screen('BlendFunction', windowPointer, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

step(windowPointer);
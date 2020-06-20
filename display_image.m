function display_image(imagePath, windowPointer) 
    img = imread(imagePath);

    % Make the image into a texture
    imageTexture = Screen('MakeTexture', windowPointer, img);

    % Draw the image to the screen, unless otherwise specified PTB will draw
    % the texture full size in the center of the screen. We first draw the
    % image in its correct orientation.
    Screen('DrawTexture', windowPointer, imageTexture, [], [], 0);

    % Flip to the screen
    Screen('Flip', windowPointer);

    % Wait for two seconds
    WaitSecs(2);
end
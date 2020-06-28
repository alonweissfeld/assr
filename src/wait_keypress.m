%{
    Sleeps the main MATLAB thread for the given
    wait preiod.
    Aborts the waiting if the given abort key was pressed.
%}
function aborted = wait_keypress(waitingTime, varargin)

    % Set default abort key
    if isempty(varargin)
        kbAbortKey = KbName('escape');
    else
        kbAbortKey = varargin{1};
    end

    aborted = false;
    waitTime = 0;
    while waitTime < waitingTime
        % Check for any keypress
        [ keyIsDown, ~, kbKeycode ] = KbCheck;

        if keyIsDown
           kbKeycode = find(kbKeycode, 1);

            % if ismember(kbKeycode, kbAbortKey) - multiple abort keys?
            if (kbKeycode == kbAbortKey)
                aborted = true;
                break;
            end
        end

        waitTime = waitTime + 0.1;
        WaitSecs(0.1);
    end

    % Empty keyboard queue
    if KbCheck
        KbReleaseWait;
    end

end
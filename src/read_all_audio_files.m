function audioFiles = read_all_audio_files(conf)
    folder = conf.AUDIO_DIR;
    if ~isfolder(folder)
        error('Error: The following folder does not exist: %s', folder);
    end
    
    % Get a list of all files in the folder with the desired file name pattern.
    files = dir(fullfile(folder, '*.mp3'));
    len = length(files);
    
    audioFiles = cell(1, len);
    for k = 1 : len
        baseFileName = files(k).name;
        fullFileName = fullfile(files(k).folder, baseFileName);

        % Read the file from the hard drive and append it to results.
        [audioData, ~] = audioread(fullFileName);
        audioFiles{k} = audioData;
    end
end
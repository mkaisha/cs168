function resampleCTP_test()

% imagePath = '/Volumes/StrokeXRAID/Kunakorn CTP/CTP Kunakorn/CTP Kunakorn Source/patient/6446781/series/';
% options.fileExtension = '.dcm';
% options.atlasFile = './CTP_data2020Atlas.mat';
% 
% [img, meta] = preProcessCTP(imagePath, options);
% motionCorrectedImg = performMotionCorrectionCTP(img, options);
% save('./testSegment.mat', 'motionCorrectedImg', 'meta', 'options');

load('./testSegment.mat', 'motionCorrectedImg', 'meta', 'options');

tic
resampledImg = resampleCTP(motionCorrectedImg, meta, options);
executionTime = toc

% executionTime: 2.4s 
% Mac Pro 2013 (parallel)

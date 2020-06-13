function resampledImg = resampleCTP(img, meta, options)
% resampleCTP: Resample CTP temporally 
%
%       [outImg] = segmentBrainCTP(inImg, options)
% 
%             Input:
%                   img     - Input image CTP; 4D. 
%                   meta    - DICOM Tags for CTP image (time is required). 
%                   options - Struct value in Matlab. The fields in options
%                         that can be set:
%                       - lengthPerfusionStudy
%                               Default value is 60 timepoints
%
%             Output:
%               resampledImg - resampled CTP image
%
%   version 1.0 --Jan/2020 
%
%   Perfuse, inc 
%
    if(isfield(options, 'lengthPerfusionStudy'))
        lengthPerfusionStudy = options.lengthPerfusionStudy;                   
    else
        lengthPerfusionStudy = 60;
    end
    
    sizeX = size(img,1);
    sizeY = size(img,2);
    sizeZ = size(img,3);
    resampledImg = zeros(sizeX, sizeY, sizeZ, lengthPerfusionStudy);
    
    lastTimePoint = max(meta.time(:));
    newTimePoints = linspace(0, lastTimePoint, lengthPerfusionStudy);

    parfor h1=1:sizeX
        for h2=1:sizeY
            for h3=1:sizeZ
                resampledImg(h1, h2, h3, :) = interp1(meta.time(h3,:),...
                    double(squeeze(img(h1, h2, h3,:))), newTimePoints, 'pchip');
            end
        end
    end


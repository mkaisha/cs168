function [img, meta] = preProcessCTP(imagePath, options)
% preProcessCTP: read CTP DICOM image files of an acquisition and re-order 
%                them with respect to slice location and time, and rescale
%                the image intensity
%
%       preProcessCTP(imagePath, options)
% 
%             Input:
%                   imagePath    - path to input images CTP, DICOM format,
%                           4D array (3D + time). 
%                   options - Struct value in Matlab. The fields in options
%                         that can be set:
%
%                          fileExtension  -  for input files
%                                           Default value is 'dcm'.  
%             Output:
%                   img    - 4D Array of the image (row,column,height,time) 
%                   meta   - struct value in Matlab with the following
%                           fields:
%                       - <time> Acquisition time of each slice
%                       - <location> Position of each slice along the Z-axis
%
%   version 1.0 --Jan/2020 
%
%   Perfuse, inc 
%

    if(isfield(options, 'fileExtension'))
        fileExtension = options.fileExtension;
    else
        fileExtension = '.dcm';
    end
    
    dirNameX = strcat(imagePath, '*', fileExtension);
    listFiles = dir(dirNameX);
    nbFrame = numel(listFiles);
    
    sliceLocations = zeros(1,nbFrame);
    imageTime = zeros(1,nbFrame);
    rescaleSlope = zeros(1,nbFrame);
    rescaleIntercept = zeros(1,nbFrame);
    
    % read meta data
    for frame=1:nbFrame     
        fname = strcat(imagePath, listFiles(frame).name);
        info = dicominfo(fname);

        rescaleSlope(frame) = info.RescaleSlope;
        rescaleIntercept(frame) = info.RescaleIntercept;
        sliceLocations(frame) = info.SliceLocation;           
     %   imageTime(frame) = str2double(info.AcquisitionTime(7:12)) + str2double(info.AcquisitionTime(5:6)) +...
     %       (str2double(info.AcquisitionTime(3:4)) .* 60) + (str2double(info.AcquisitionTime(1:2)) * 60 * 60);       
        
        imageTime(frame) = info.AcquisitionNumber;
    end
    imageTime = imageTime - min(imageTime);  
    uSlices = unique(sliceLocations);
    uTemporal = unique(imageTime);

    % read imaging data and rescale intensity
    tmp = zeros(info.Width, info.Height, nbFrame);   
    for frame=1:nbFrame       
        fname = strcat(imagePath, listFiles(frame).name);
        tmp(:,:,frame) = dicomread(fname);
        tmp(:,:,frame) = (double(tmp(:,:,frame)) .* rescaleSlope(frame)) +  rescaleIntercept(frame);
    end
    
    % reorder imaging data based on slice and temporal information    
    img = zeros(info.Width, info.Height, nnz(uSlices), nnz(uTemporal));
    temporalInfo = zeros(nnz(uSlices), nnz(uTemporal));
    locationInfo = zeros(nnz(uSlices), nnz(uTemporal));
    
    for sliceIdx=1:numel(uSlices)
        for temporalIdx=1:numel(uTemporal)
            idx = (sliceLocations == uSlices(sliceIdx)) & (imageTime == uTemporal(temporalIdx));
            img(:, :, sliceIdx, temporalIdx) = double(tmp(:,:,idx));
            temporalInfo(sliceIdx, temporalIdx) = imageTime(idx);
            locationInfo(sliceIdx, temporalIdx) = sliceLocations(idx);
        end
    end
    
    meta.time = temporalInfo;       % Acquisition time of each frame 
    meta.location = locationInfo;   % Position of each frame along the Z-axis
    
end
    
    
    
    
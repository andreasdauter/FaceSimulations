close all; clear all; clc;

%PARAMETERS
file_volume_Mask=   '/home/bhlab/morpheus/1-Inputs/e105-RightMaxilla-label.tiff';
file_volume_ToMask= '/home/bhlab/morpheus/1-Inputs/Dec2_E10_9_ProliferatingCells_Masked_AvgAffine.tiff';
file_dest_Masked=   '/home/bhlab/morpheus/1-Inputs/Original_Sample/MxP_Cropped_3D_ProliferatingCells_Masked_AvgAffine.tiff';

%-----------------------------------------------------

[volumeMask,fileInfoMask] = functionReadTIFFMultipage(file_volume_Mask);
[volumeToMask,fileInfoToMask] = functionReadTIFFMultipage(file_volume_ToMask);

volumeMasked = zeros(size(volumeToMask));
volumeMasked(volumeMask>0) = volumeToMask(volumeMask>0);


%Identify maxima along each axis and crop
[rows, cols, slices] = findND(volumeMasked>0);
firstRow = min(rows);
lastRow = max(rows);
firstCol = min(cols);
lastCol = max(cols);
firstSlice = min(slices);
lastSlice = max(slices);

volumeMasked = volumeMasked(firstRow:lastRow,firstCol:lastCol,firstSlice:lastSlice);




functionSaveTIFFMultipage(volumeMasked,file_dest_Masked,8);
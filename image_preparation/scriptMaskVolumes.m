close all; clear all; clc;

%PARAMETERS
file_volume_Mask=   '/home/bhlab/Desktop/Dev_Maxilla/FNP/E10.5/e105-RightMaxilla-label.tiff';
file_volume_ToMask= '/home/bhlab/morpheus/1-Inputs/Dec2_E10_9_Cells_Maxilla.tiff';
file_dest_Masked=   '/home/bhlab/morpheus/1-Inputs/MxP_Cropped_3D.tiff';

%-----------------------------------------------------

[volumeMask,fileInfoMask] = functionReadTIFFMultipage(file_volume_Mask);
[volumeToMask,fileInfoToMask] = functionReadTIFFMultipage(file_volume_ToMask);

volumeMasked = zeros(size(volumeToMask));
volumeMasked(volumeMask>0) = volumeToMask(volumeMask>0);


%Identify maxima along each axis and crop
[rows, cols] = find(volumeMasked>0);
firstRow = rows[1]
lastRow = rows[end]
firstCol = cols[1]
lastCol = cols[end]

volumeMasked = volumeMasked(firstRow:lastRow,firstCol:lastCol,:)




functionSaveTIFFMultipage(volumeMasked,file_dest_Masked,8);
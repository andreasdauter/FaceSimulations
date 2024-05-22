clear all; close all; clc;
%clc;
file_cells_Masked=  '/home/bhlab/morpheus/1-Inputs/Maxilla_Croptest.tiff';
file_list= '/home/bhlab/morpheus/1-Inputs/MxP_Cropped_E10.5_3D_WV.csv'

[volumeCells,fileInfoMask]  = functionReadTIFFMultipage(file_cells_Masked);
volumeCells = volumeCells>0;


%volumeCellsErode = imerode(volumeCells,ones(1,1,1));

CC_Cells = bwconncomp(volumeCells,6)

CC_Cells_stats = regionprops3(CC_Cells,'Centroid','Volume');

Cells_Centroids = CC_Cells_stats.Centroid;
Cells_Volume = CC_Cells_stats.Volume;


matResult = zeros(CC_Cells.NumObjects,4);
matResult(:,1:3) = floor(Cells_Centroids);
matResult(:,4) = Cells_Volume;

%cull small cells
rowsToDelete = matResult(:,4) < 5;
matResult(rowsToDelete,:) = [];

%Remove volume info
matResult = matResult(:,1:3);


%Write result
csvwrite(file_list,matResult);
clear all; close all; clc;

%PARAMETERS
file_binary_vol=   '/home/bhlab/morpheus/1-Inputs/FNP/FNP_Cropped_3D.tiff';
file_dest=   '/home/bhlab/morpheus/1-Inputs/FNP_Symmetric.tiff';


[volumeBinary,fileInfoBinary] = functionReadTIFFMultipage(file_binary_vol);

volumeMultiplied = volumeBinary * 255;

functionSaveTIFFMultipage(volumeMultiplied,file_dest,8);
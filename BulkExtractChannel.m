

clear all
close all
clc


directory_name = uigetdir;
 cd(directory_name)
files = dir(directory_name);

fileIndex = find(~[files.isdir]);


for i = 1:length(fileIndex)

filename = files(fileIndex(i)).name;
InfoImage=imfinfo(filename);
mImage=InfoImage(1).Width;
nImage=InfoImage(1).Height;
NumberImages=length(InfoImage); % =nume(InfoImage);


%green
green_tiff=imread(filename, 1);
for ii = 3 :2: NumberImages
temp_tiff = imread(filename, ii);
green_tiff=cat(3,green_tiff, temp_tiff);
end

Sname = [filename(1:length(filename)-4) '_ Green Chh'];
save(Sname,'green_tiff') %save data .mat

end
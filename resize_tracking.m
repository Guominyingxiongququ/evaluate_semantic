fileListing  = dir('/home/xiyu/Downloads/06/resize_cityscapes/*.png');
// This is the absolute path of the input folder

curMax = 0;

idx = 0;
for idx = 1:numel(fileListing)
    [fileIdx,leftImg] = getName(fileListing(idx));
    
    resultName = strcat('/home/xiyu/Desktop/project/trackingLinux64/',fileIdx{1},'.ppm')
    // This is the output path 
    I = imread(leftImg);
    J = imresize(I,[256,512]);
    //image size
    imwrite(J,resultName);
    idx = idx +1;
end

function [fileIdx, fullName] = getName(inputFile)
    folder = inputFile.folder;
    name = inputFile.name
    strList = strsplit(name,'.');
    fileIdx = strList(1);
    fullName = strcat(folder,'/',name);    
end
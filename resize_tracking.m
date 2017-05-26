fileListing  = dir('/home/xiyu/Downloads/06/resize_cityscapes/*.png');

curMax = 0;

idx = 0;
for idx = 1:numel(fileListing)
    [fileIdx,leftImg] = getName(fileListing(idx));
    
    resultName = strcat('/home/xiyu/Desktop/project/trackingLinux64/',fileIdx{1},'.ppm')
    I = imread(leftImg);
    J = imresize(I,[256,512]);
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
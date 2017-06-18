I1 = imread('filtered_gt.png');
I2 = imread('filtered_crf.png');

// This is the absolute path of input files. This should be changed when using this script

% I1 = imread('filtered_gt.png');
% I2 =imread('filtered_result.png');
I1 = imresize(I1,[370,1226]);
I2 = imresize(I2,[370,1226]);

imshow(I1);
imshow(I2);

// This is the selected classes. If you need to evaluate more classes, 
// the labled colors of different classes should be added manually.

selectClass = cell(13,2);
selectClass{1,1}=[0,0,255];
selectClass{1,2}=[0,0,142];
selectClass{2,1}=[255,0,0];
selectClass{2,2}=[128,64,128];
selectClass{3,1}=[255,255,0];
selectClass{3,2}=[220,220,0];
% selectClass{4,1}=[0,255,0];
% selectClass{4,2}=[70,70,70];
selectClass{4,1}=[255,0,255];
selectClass{4,2}=[244,35,232];
selectClass{5,1}=[0,255,255];
selectClass{5,2}=[107,142,35];
selectClass{6,1}=[255,0,153];
selectClass{6,2}=[153,153,153];
selectClass{7,1}=[255,153,0];
selectClass{7,2}=[70,130,180];
selectClass{8,1}=[0,255,0];
selectClass{8,2}=[70,70,70];
totalTP =0;
totalFP =0;
totalFN =0;

for i = 1:8
    [BW,maskedRGBImage] = createMask(I1,selectClass{i,1});
    [BW_1, maskedRGBImage_1] = createMask(I2,selectClass{i,2});
    % plot the original image, mask and filtered image all in one figure
    curBW = BW;
    curBW(~BW_1) = 0;
    size_BW = nnz(BW==1);
    size_curBW = nnz(curBW==1);
    TP = size_curBW;
    FP = nnz(BW_1==1)-TP;
    FN = nnz(BW==1)-TP;
    totalTP = TP + totalTP;
    totalFP = FP + totalFP;
    totalFN = FN + totalFN;
imshow(BW);
imshow(BW_1);
end

IOU = totalTP/(totalTP + totalFP +totalFN)

% subplot(1,3,1);imshow(I2);title('Original Image');
% subplot(1,3,2);imshow(BW_1);title('Mask');
% subplot(1,3,3);imshow(maskedRGBImage_1);title('Filtered Image');

function [BW,maskedRGBImage] = createMask(I,classColor) 

% Create mask based on chosen histogram thresholds
BW = (I(:,:,1) == classColor(1)) & (I(:,:,2) == classColor(2) ) & (I(:,:,3) == classColor(3) );
BW = (I(:,:,1) >= classColor(1)-20) & (I(:,:,1) <= classColor(1)+20) & (I(:,:,2) >= classColor(2)-20) & (I(:,:,2) <= classColor(2)+20) & (I(:,:,3) >= classColor(3)-20 ) &(I(:,:,3) <= classColor(3)+20 );
    maskedRGBImage = I;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end

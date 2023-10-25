clc;clear;close all;
I = imread('bird.jpg'); % 读取目标图像
% RGB到二值图转换
if(size(I,3) == 3)
    IG = rgb2gray(I);
    bw = imbinarize(IG); % 二值化
elseif (islogical(I))
    bw = I;      
else
    bw = imbinarize(I); % 二值化
end
 
 
% 法一
bw = imfill(~bw,'holes'); 
bound = bwboundaries(bw,8,'noholes');
x = bound{1}(:,2);
y = bound{1}(:,1);
imshow(I);
hold on;
plot(x,y,'k--','linewidth',2.5);
hold off;
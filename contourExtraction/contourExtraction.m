clc; clear; close all;
%% 获取边界轮廓的坐标
%https://blog.csdn.net/rz1314/article/details/120376164
% 
% I = imread('bird.jpg'); % 读取目标图像
% % RGB到二值图转换
% if (size(I, 3) == 3)
%     IG = rgb2gray(I);
%     bw = imbinarize(IG); % 二值化
% elseif (islogical(I))
%     bw = I;
% else
%     bw = imbinarize(I); % 二值化
% end
% 
% % 法一
% bw = imfill(~bw, 'holes');
% bound = bwboundaries(bw, 8, 'noholes');
% x = bound{1}(:, 2);
% y = bound{1}(:, 1);
% imshow(I);
% hold on;
% plot(x, y, 'k--', 'linewidth', 2.5);
% hold off;

axis_x=[2 3 4 5 4 3 2 1]';
axis_y=[4 3 4 3 2 1 2 3]';
% fig=figure(1);
% plot(axis_x, axis_y, 'k--', 'linewidth', 2.5);
% hold on;
%% 
x=axis_x+1i*axis_y;
X=fft(x);
k=2;
a=exp(1i*2*pi.*k.*(0:1:length(X)-1)./length(X));
a=a';
%sum(fft(x))
b=sum(X.*a)/8
% quiver(zeros(length(X),1),zeros(length(X),1),real(X),imag(X));
% 
% pos=[real(X)-abs(X),imag(X)-abs(X),2*abs(X),2*abs(X)];
% % rectangle('Position',pos,'Curvature',[1 1]);
% for i=1:1:length(pos)
% rectangle('Position',pos(i,:),'Curvature',[1 1]);
% end
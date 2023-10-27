clc; clear; clf; %close all;
%% 获取边界轮廓的坐标
%https://blog.csdn.net/rz1314/article/details/120376164
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

% 画一个简单的爱心
axis_x = [2 3 4 5 4 3 2 1 1.5]';
axis_y = [4 3 4 3 2 1 2 3 3.5]';
fig = figure(1);
fig.Position = [-1315, 751, 560, 420];
plot(axis_x, axis_y, 'k--', 'linewidth', 2.5);
hold on;
%%
x = axis_x + 1i * axis_y;
X = fft(x);
N = length(X);
% 验证傅里叶反变换
% x_verify=ifft(X);
% n=1;
% k=(0:1:length(X)-1);
% k=k';
% a=exp(1i*2*pi.*n.*k./length(X));
% x_n_verify=sum(X.*a)/8;

% points1 = scatter(real(X), imag(X));
% points1.Marker = "*";

n = 0;
k = (0:1:N - 1);
k = k';
Xn = X .* exp(1i * 2 * pi .* n .* k ./ N);
x_n_verify = sum(Xn) ./ 8;
X_add = Xn;

X_add(1) = 0;

for i = 1:1:N
    X_add(i + 1) = sum(Xn(1:i));
end

X_add = X_add ./ N;
vectorSum = plot(X_add);
vectorSum.LineWidth = 2;
points2 = scatter(real(X_add), imag(X_add), "filled");
axis equal
ax = gca;
ax.XMinorGrid = "on";
ax.YMinorGrid = "on";

pos = zeros(N, 4);

for i = 1:1:N
    pos(i, 1) = real(X_add(i)) - abs(Xn(i) ./ N);
    pos(i, 2) = imag(X_add(i)) - abs(Xn(i) ./ N);
    pos(i, 3) = 2 * abs(Xn(i) ./ N);
    pos(i, 4) = 2 * abs(Xn(i) ./ N);
end

for i = 1:1:length(pos)
    rectangle('Position', pos(i, :), 'Curvature', [1 1], 'LineWidth', 1, 'LineStyle', '--');
end

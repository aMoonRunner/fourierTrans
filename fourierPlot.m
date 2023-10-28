%% %% 傅里叶变换画图====================================================
% 文件名：fourierCalcu.m
% 描述：分别计算离散傅里叶变换的每一个X[k],并作图。每一小项都算出来，再求和
% 创建人：sjh
% 创建时间：2023年10月17日
% 当前版本：v0.1
% ======================================================================
% 修改人：
% 修改时间：
% 修改内容：
clc; clear; clf; %close all;

% 画一个简单的爱心
axis_x = [2 3 4 5 4 3 2 1]';
axis_y = [4 3 4 3 2 1 2 3]';
fig = figure(1);
fig.Position = [-1315, 751, 560, 420];
plot(axis_x, axis_y, 'k--', 'linewidth', 2.5);
hold on;
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


%求X[k]旋转后的矢量
n = 0;
k = (0:1:N - 1);
k = k';
Xn_rotated = X .* exp(1i * 2 * pi .* n .* k ./ N);
% x_n_verify = sum(Xn_rotated) ./ N;稍作验证

%求前i个矢量的和
X_add = Xn_rotated;
X_add(1) = 0;
for i = 1:1:N
    X_add(i + 1) = sum(Xn_rotated(1:i));
end
X_add = X_add ./ N;

vectorSum = plot(X_add);
vectorSum.LineWidth = 2;
points2 = scatter(real(X_add), imag(X_add), "filled");
axis equal
ax = gca;
ax.XMinorGrid = "on";
ax.YMinorGrid = "on";

%画圈
pos = zeros(N, 4);
for i = 1:1:N
    pos(i, 1) = real(X_add(i)) - abs(Xn_rotated(i) ./ N);
    pos(i, 2) = imag(X_add(i)) - abs(Xn_rotated(i) ./ N);
    pos(i, 3) = 2 * abs(Xn_rotated(i) ./ N);
    pos(i, 4) = 2 * abs(Xn_rotated(i) ./ N);
end
for i = 1:1:length(pos)
    rectangle('Position', pos(i, :), 'Curvature', [1 1], 'LineWidth', 1, 'LineStyle', '--');
end

copygraphics(gcf,"ContentType","image","Resolution",100);
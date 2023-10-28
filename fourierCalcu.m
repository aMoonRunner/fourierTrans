%% 离散傅里叶变换示意====================================================
% 文件名：fourierCalcu.m
% 描述：分别计算离散傅里叶变换的每一个X[k],并作图。每一小项都算出来，再求和
% 创建人：sjh
% 创建时间：2023年10月17日
% 当前版本：v0.1
% ======================================================================
% 修改人：
% 修改时间：
% 修改内容：

clc; clear; clf;
N = 20;
n = (0:1:N - 1);
k = 2; 
xn = cos(4 .* pi .* (n ./ N) + pi); 
yn = cos(2 .* pi .* k .* (n ./ N)); 
X_k_array = xn .* yn; 
X_k_sumArray = X_k_array; 
for i = 2:1:length(X_k_sumArray) 
    X_k_sumArray(i) = X_k_sumArray(i) + X_k_sumArray(i - 1);
end

myFig = figure(1);
myFig.Color = [1, 1, 1];
subplot(2, 1, 1);
stem(n, xn, "LineWidth", 2);
hold on;
stem(n, yn, "LineWidth", 2);
lgd = legend("$x[n]$", "$cos(2\pi k\frac{n}{N})$");
lgd.Interpreter = "latex";
ax = gca;
ax.FontName = "Times New Roman";
titleText = sprintf('k=%d', k);
ax.Title.String = titleText;

subplot(2, 1, 2);
stem(n, X_k_array, "LineWidth", 2);
hold on;
plot(n, X_k_sumArray, "LineWidth", 2);
yline(0);
lgd = legend("product", "integral value");
lgd.Interpreter = "latex";
ax = gca;
ax.FontName = "Times New Roman";
titleText = sprintf('k=%d', k);
ax.Title.String = titleText;

copygraphics(gcf, "ContentType", "image", "Resolution", 100);

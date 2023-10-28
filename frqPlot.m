%% 离散信号频率示意================================
% 文件名：frqPlot.m
% 描述：画图说明，在采样频率20Hz时，是无法分辨1Hz和19Hz信号的
% 创建人：sjh
% 创建时间：2023年10月17日
% 当前版本：v0.1
% ======================================================================
% 修改人：
% 修改时间：
% 修改内容：
clc;clear;close all;
x=(0:0.001:1);
y1=cos(2*pi*x);
y2=cos(2*pi*19*x);
line_y1=plot(x,y1,"LineWidth",2);
hold on;
line_y2=plot(x,y2,"LineWidth",2);
line_y2.Marker="o";
line_y2.MarkerIndices=(1:50:length(y2));
copygraphics(gcf,"ContentType","image","Resolution",100);

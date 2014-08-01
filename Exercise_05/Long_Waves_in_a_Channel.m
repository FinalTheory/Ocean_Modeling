%% 知识点：
% 任意调整坐标轴的比例；
% 读取模式输出数据并绘制动画；
% 调整Figure在屏幕中显示的位置和大小。

%% 清空并读入数据
clear; clc; close all;
% 注意下面的这种load写法，与常见的写法有何区别？
eta = load('output_eta.txt');

%% 开始作图

% 构造横坐标并绘图
x = 0:10:1020;
h1 = plot(x, eta(1, :), '-');
% 设定标题并保存句柄
% 注意这里是如何连接字符串的？为什么要这样连接？用strcat不可以吗？
h2 = title(['第 ', num2str(0), ' 时间步'], 'fontsize', 15);
xlabel('水平位置 (m)', 'fontsize', 12);
ylabel('水位 (m)', 'fontsize', 12);
% 调整横纵坐标比例，Z方向的不用管
set(gca, 'DataAspectRatio', [200 1.1 1])
% 设定当前Figure在屏幕中显示的位置，前两项表示Figure左下角坐标，后两项则分别是宽度和高度
set(gcf, 'Position', [100 100 1200 400]);
% 设定坐标表示范围
axis([-10, 1030, -1.1, 1.1]);
pause(1);
for i = 2:size(eta, 1)
   axis([-10, 1030, -1.1, 1.1]);
   set(h1, 'YData', eta(i, :));
   % 注意如何更新标题文字
   set(h2, 'String', ['第 ', num2str(i - 1), ' 时间步'])
   pause(0.01);
end
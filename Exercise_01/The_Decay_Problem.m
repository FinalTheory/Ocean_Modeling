%% 知识点：
% 数据的读取
% plot绘制曲线的基本用法
% 绘图后的标注以及微调

%% 养成良好的编程习惯
% 首先清空先前的所有数据、清空当前屏幕上的信息、关闭所有打开的窗口
% 这是为了排除其他干扰，当运行程序后，你看到的信息就是你的程序所输出的信息
clear; clc; close all;

% 载入程序的输出数据
% 排列整齐的txt文本文件可以直接这样载入
load explicit.txt
load implicit.txt
load semi-implicit.txt

% 产生一个行向量，对应于绘图的横坐标
x = 0:15;

% plot函数的具体用法请doc plot
% 可以通过这样的简写方式来指定曲线颜色、线型、数据点标识
% 例如，对于第一行命令中的'b-o'：b表示颜色为蓝色，-表示为直线，o表示要用圆圈来标识这个点是数据点
h1 = plot(x, semi_implicit, 'b-o'); hold on;
h2 = plot(x, explicit, 'r:^'); hold on;
h3 = plot(x, implicit, 'g-.^'); hold on;

% 设置横、纵坐标标注以及标题
% 注意如何指定标注的字体大小
xlabel('时间 (小时)', 'fontsize', 12);
ylabel('浓度 (百分比)', 'fontsize', 12);
title('浓度随时间变化的关系曲线', 'fontsize', 15)

% 虽然其实这样写也可以：
% legend('半隐半显格式', '显格式', '隐格式');
% 但是通过操作句柄设置图列，是一种更为靠谱的方式
% 因为这样做的话，我们不用关心三条曲线被创建的顺序
% 请亲自动手试试，体会一下这两者的区别
legend([h1, h2, h3], '半隐半显格式', '显格式', '隐格式');
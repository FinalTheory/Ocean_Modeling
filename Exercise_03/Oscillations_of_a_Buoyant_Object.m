%% 知识点：
% 绘图窗口自动放大至全屏；
% 使用handle（句柄）来控制绘图；
% 面向对象编程（OOP）的基本思想；
% 初步使用LaTex语法书写数学公式。

%% 什么是对象？
% MATLAB中的对象是什么？由哪些要素构成？
% 所有的对象都一样吗？如何指定特定对象？
% handle（句柄）本质上代表着什么？

%% 首先清理并载入数据
clear; clc; close all;
load z.txt
load w.txt

%% 代码部分

h1 = subplot(211);
plot(h1, z);
xlabel(h1, '时间 (s)');
ylabel(h1, '位置 (m)');
title(h1, '物体位置随时间的变化', 'fontsize', 12);

h2 = subplot(212);
plot(h2, w);
xlabel(h2, '时间 (s)');
% 请注意图中“米每秒”的单位是怎样得到的？
ylabel(h2, '速度 (m\cdots^{-1})');
title(h2, '物体速度随时间的变化', 'fontsize', 12);

% 这一句的作用就是就将当前Figure放大至全屏
set(gcf,'Position',get(0,'ScreenSize'));

% Tips:
% 不仅仅上述函数可以接受一个handle作为输入参数，事实上，MATLAB中几乎所有的绘图函数都支持这种用法。
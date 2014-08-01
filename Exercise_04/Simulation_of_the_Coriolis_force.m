%% 知识点：
% 高级动画绘制方法：利用句柄更新数据；
% GUI编程初步：按钮的使用。

%% 清空并读取数据
clear; clc; close all;
load data.txt;

%% 初始化窗口设定

% 下面这些参数设定参照字面意思即可
set(gcf,'color','white','menubar','none','numbertitle','off','name','Coriolis Force')
% 添加一个按钮，并保存其handle
stop = uicontrol('style','toggle','string','stop','background','white');

%% 开始绘图

% 首先取出数据中的坐标
x = data(:, 1);
y = data(:, 2);
% 构造一个新的向量，存储的是构成轨迹的数据点
x_plot = x(1);
y_plot = y(1);
% 将初始点的位置画上去，注意不要被覆盖
h1 = scatter(x(1), y(1), 'r'); hold on;
% 然后再绘制上蓝色轨迹
h2 = plot(x_plot, y_plot, '-');
% 设定坐标轴取值范围和比例（等比例）
axis equal;
axis([-1, 1, -1, 1]);
pause(1);
for i = 2:size(x, 1)
    % 每次循环时检查按钮是否被按下，如果是的话就退出循环
    if ( get(stop, 'value') == 1 ); break; end
    axis equal;
    axis([-1, 1, -1, 1]);
    % 更新轨迹的数据点
    x_plot(end + 1) = x(i);
    % 注意，当需要动态增加数组大小时，y_plot = [y_plot, y(i)]这种写法远远慢于下面的写法！
    % 尽管如此，编辑器依然会对这种写法提出警告。当然，预先分配好空间还是最快的方式。
    y_plot(end + 1) = y(i);
    % 更新对应对象的数据
    set(h1, 'Xdata', x(i), 'Ydata', y(i));
    set(h2, 'Xdata', x_plot, 'Ydata', y_plot);
    pause(.05);
end

% 如果退出了循环，就修改按钮的功能，将'callback'项改为'close(gcf)'，即用于关闭当前Figure
set(stop,'style','pushbutton','string','close','callback','close(gcf)')
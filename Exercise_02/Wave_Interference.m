clear; clc; close all;
%% 知识点：
% 编码规范
% subplot绘制
% gif动画的创建
% 通过句柄修改数据

%% 对于一个可能需要改动参数的脚本，首先应当在开始处将所有参数定义为变量
% 而对于只出现一次或者不怎么会发生改动的参数，则可以不这样做

% 振幅
A0 = 1;
% 第一个波形的波长和周期
Len1 = 100;
T1 = 60;
% 第二个波形的波长和周期
Len2 = 95;
T2 = -30;

x = 0:0.01:10 * Len1;
trange = 2 * T1;
dt = trange / 100;
numTotal = trange / dt;

t = 0.;

for i = 1:numTotal
    f1 = A0 * sin(2 * pi * ( x / Len1 - t / T1));
    f2 = A0 * sin(2 * pi * ( x / Len2 - t / T2));
    f3 = f1 + f2;
    % 在第一次循环中，我们先要创建图像
    if ( i == 1 )
        % subplot的用法可以参考文档
        subplot(311);
        h1 = plot(x, f1);
        title('Wave 1', 'fontsize', 12);
        subplot(312);
        h2 = plot(x, f2);
        title('Wave 2', 'fontsize', 12);
        subplot(313);
        h3 = plot(x, f3);
        title('Wave 1 + 2', 'fontsize', 12);
        set(gca, 'ylim', [-2, 2]);
    else
        % 然后我们使用句柄来修改数据，而不是用plot重新绘图
        % 因为多数情况下，图像都可以通过这种方式直接被更新
        % 并且效率会远远高于重新用plot绘图的方式
        set(h1, 'YData', f1);
        set(h2, 'YData', f2);
        set(h3, 'YData', f3);
    end
    % 下面三行代码是用来获取当前图像的，使用时直接复制就可以
    frame = getframe(1);
    im = frame2im(frame);
    [imind, cm] = rgb2ind(im, 256);
    if ( i == 1 )
        % 在第一次执行循环时，我们要新建一个gif图像，'anim.gif'为指定的文件名
        % 'Loopcount'参数指定动画的循环次数，也可设为0，表示不循环播放
        % 更为详细的用法请参考文档
        imwrite(imind, cm, 'anim.gif', 'gif', 'Loopcount', Inf, 'DelayTime', .5);
    else
        % 从第二次循环开始，则要每次往gif中追加图像帧
        % 一般我们只要修改最后一个参数，即每一帧之间的时间差即可，这里为0.05秒
        imwrite(imind, cm, 'anim.gif', 'gif', 'WriteMode', 'append', 'DelayTime', 0.05);
    end
    t = t + dt;
end
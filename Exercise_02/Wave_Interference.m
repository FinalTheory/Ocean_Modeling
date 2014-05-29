clear; clc; close all;
%% ֪ʶ�㣺
% ����淶
% subplot����
% gif�����Ĵ���
% ͨ������޸�����

%% ����һ��������Ҫ�Ķ������Ľű�������Ӧ���ڿ�ʼ�������в�������Ϊ����
% ������ֻ����һ�λ��߲���ô�ᷢ���Ķ��Ĳ���������Բ�������

% ���
A0 = 1;
% ��һ�����εĲ���������
Len1 = 100;
T1 = 60;
% �ڶ������εĲ���������
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
    % �ڵ�һ��ѭ���У�������Ҫ����ͼ��
    if ( i == 1 )
        % subplot���÷����Բο��ĵ�
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
        % Ȼ������ʹ�þ�����޸����ݣ���������plot���»�ͼ
        % ��Ϊ��������£�ͼ�񶼿���ͨ�����ַ�ʽֱ�ӱ�����
        % ����Ч�ʻ�ԶԶ����������plot��ͼ�ķ�ʽ
        set(h1, 'YData', f1);
        set(h2, 'YData', f2);
        set(h3, 'YData', f3);
    end
    % �������д�����������ȡ��ǰͼ��ģ�ʹ��ʱֱ�Ӹ��ƾͿ���
    frame = getframe(1);
    im = frame2im(frame);
    [imind, cm] = rgb2ind(im, 256);
    if ( i == 1 )
        % �ڵ�һ��ִ��ѭ��ʱ������Ҫ�½�һ��gifͼ��'anim.gif'Ϊָ�����ļ���
        % 'Loopcount'����ָ��������ѭ��������Ҳ����Ϊ0����ʾ��ѭ������
        % ��Ϊ��ϸ���÷���ο��ĵ�
        imwrite(imind, cm, 'anim.gif', 'gif', 'Loopcount', Inf, 'DelayTime', .5);
    else
        % �ӵڶ���ѭ����ʼ����Ҫÿ����gif��׷��ͼ��֡
        % һ������ֻҪ�޸����һ����������ÿһ֮֡���ʱ���ɣ�����Ϊ0.05��
        imwrite(imind, cm, 'anim.gif', 'gif', 'WriteMode', 'append', 'DelayTime', 0.05);
    end
    t = t + dt;
end
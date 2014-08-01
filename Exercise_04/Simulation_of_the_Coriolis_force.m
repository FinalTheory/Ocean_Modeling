%% ֪ʶ�㣺
% �߼��������Ʒ��������þ���������ݣ�
% GUI��̳�������ť��ʹ�á�

%% ��ղ���ȡ����
clear; clc; close all;
load data.txt;

%% ��ʼ�������趨

% ������Щ�����趨����������˼����
set(gcf,'color','white','menubar','none','numbertitle','off','name','Coriolis Force')
% ���һ����ť����������handle
stop = uicontrol('style','toggle','string','stop','background','white');

%% ��ʼ��ͼ

% ����ȡ�������е�����
x = data(:, 1);
y = data(:, 2);
% ����һ���µ��������洢���ǹ��ɹ켣�����ݵ�
x_plot = x(1);
y_plot = y(1);
% ����ʼ���λ�û���ȥ��ע�ⲻҪ������
h1 = scatter(x(1), y(1), 'r'); hold on;
% Ȼ���ٻ�������ɫ�켣
h2 = plot(x_plot, y_plot, '-');
% �趨������ȡֵ��Χ�ͱ������ȱ�����
axis equal;
axis([-1, 1, -1, 1]);
pause(1);
for i = 2:size(x, 1)
    % ÿ��ѭ��ʱ��鰴ť�Ƿ񱻰��£�����ǵĻ����˳�ѭ��
    if ( get(stop, 'value') == 1 ); break; end
    axis equal;
    axis([-1, 1, -1, 1]);
    % ���¹켣�����ݵ�
    x_plot(end + 1) = x(i);
    % ע�⣬����Ҫ��̬���������Сʱ��y_plot = [y_plot, y(i)]����д��ԶԶ���������д����
    % ������ˣ��༭����Ȼ�������д��������档��Ȼ��Ԥ�ȷ���ÿռ仹�����ķ�ʽ��
    y_plot(end + 1) = y(i);
    % ���¶�Ӧ���������
    set(h1, 'Xdata', x(i), 'Ydata', y(i));
    set(h2, 'Xdata', x_plot, 'Ydata', y_plot);
    pause(.05);
end

% ����˳���ѭ�������޸İ�ť�Ĺ��ܣ���'callback'���Ϊ'close(gcf)'�������ڹرյ�ǰFigure
set(stop,'style','pushbutton','string','close','callback','close(gcf)')
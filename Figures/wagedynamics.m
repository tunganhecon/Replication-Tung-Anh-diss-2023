close all; clear all; clc;
cd("C:\Users\Tung Anh\Documents\UCL 2022-2023\Dissertation\Datasets")

xlsread('SAwagedynamics.xlsx');
period = ans(:,1);
unemp = ans(:,2);
ypoach = ans(:,3);
ycurrent = ans(:,4);
wage = ans(:,5);

leg1 = 'Unemployment value';
leg2 = 'Poaching firm''s max offer';
leg3 = 'Current firm''s max offer';
leg4 = 'Worker''s wage';

p1 = plot(period,unemp, Color='#000000',LineWidth=2,LineStyle='--');
hold on
p2 = plot(period,ypoach, Color='#bf1818', LineWidth=1);
p3 = plot(period,ycurrent, Color='#2209c3',LineWidth=1);
p4 = plot(period,wage, Color='#137A7F',LineWidth=3, LineStyle='--');
set(gca,'XTick',[], 'YTick', [])
axis([1,27,0,15]);
legend([p1,p2,p3,p4],{leg1,leg2,leg3,leg4},'Interpreter','latex','Location','northeast','FontSize',14)






close all; clear all; clc;
cd("C:\Users\Tung Anh\Documents\UCL 2022-2023\Dissertation\Datasets")

xlsread('eehetero.xls');
year = ans(:,3);
month = ans(:,4);
day = ones(length(month),1);
time = datetime(year,month,day);
clear year month

EE_l50 = ans(:,1);
EE_h50 = ans(:,2);

EE_l50 = 100*movmean(EE_l50,12);
EE_h50 = 100*movmean(EE_h50,12);

leg1   = 'EE transition below median wage';
leg2   = 'EE transition above median wage';

p1          = plot(time,EE_l50, Color='#137a7f',LineWidth=2);
hold on
p2          = plot(time,EE_h50,Color='#e12885',LineWidth=2);
hold off
recessionplot
set(gca,'FontSize',14,'TickLabelInterpreter','latex')
xlabel('Year','FontSize',14,'Interpreter','latex')
ylabel('Rate (%)', 'FontSize',14, 'Interpreter','latex')
legend([p1,p2],{leg1,leg2},'Interpreter','latex','Location','SouthEast','FontSize',8)
saveas(gcf,'EEhetero','epsc')
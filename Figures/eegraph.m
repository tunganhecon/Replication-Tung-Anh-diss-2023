close all; clear all; clc;
cd("C:\Users\Tung Anh\Documents\UCL 2022-2023\Dissertation\Datasets")

xlsread('EE-FMP-May2023.xlsx','Data');
year = ans(:,3);
month = ans(:,4);
day = ones(length(month),1);
time = datetime(year,month,day);
clear year month

EEFMP = ans(:,5);
EE = 100*movmean(EEFMP,12);

figure;
plot(time,EE,'LineWidth',2,'Color','[(0.07450980392,0.47843137254,0.49803921568]')
recessionplot
xlabel('Year','FontSize',14,'Interpreter','latex')
ylabel('Rate (%)', 'FontSize',14, 'Interpreter','latex')
saveas(gcf,'EE','epsc')

%Godunuv_1stOrder
%@Author: Benjamin C. 

close all
clc
clearvars
%% Inital conditions
dx=1;%2.5 1 0.5
x=1:dx:dx*round(100/dx);
y_ini=zeros(size(x));
y_ini(round(numel(x)/2)-(5/dx):round(numel(x)/2)+(5/dx))=1;
y=y_ini;
nb=numel(x);

%% Plot ini
f1=figure('color','white');
plot(x,y,'r','linewidth',2)
xlabel('x'); 
ylabel('y');
xlim([1 max(x)]);
ylim([0 max(y)*1.3])

%% Velocity
c=-1;
c_lin=ones(size(x)).*c;

%% Timestep
dt_max=dx/abs(c);
dt=dt_max;
dt=.25;
tot_T=100/abs(c);
steps=tot_T/dt-(1/abs(c))/dt;


for t=1:steps    
    % Compute fluxes 
     if c>0
        i=2:nb;
        %...
        %BC: periodic 
        y(1)=y(end);
     else       
        i=1:nb-1;
        %...
        %BC: periodic 
        y(end)=y(1);
     end      
    
    %% Plot 
    figure(f1);
    clf
    plot(x,y_ini,'r','linewidth',2)
    hold on
    plot(x,y,'k','linewidth',2)
    xlabel('x');
    ylabel('y');
    xlim([1 max(x)]);
    ylim([0 max(y_ini)*1.3])
    
    pause(0.0001)
    
end
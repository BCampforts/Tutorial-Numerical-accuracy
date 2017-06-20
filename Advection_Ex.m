%Advection
%@Author: Benjamin C. 

close all
clc
clearvars
%% Inital conditions
dx=2.5;%2.5 1 0.5
x=1:dx:dx*round(100/dx);
y_ini=zeros(size(x));
y_ini(round(numel(x)/2)-(5/dx):round(numel(x)/2)+(5/dx))=1;
y=y_ini;

%% Plot ini
f1=figure('color','white');
plot(x,y,'r','linewidth',2)
xlabel('x'); 
ylabel('y');
xlim([1 max(x)]);
ylim([0 max(y)*1.3])

%% Velocity
c=1;
c_lin=ones(size(x)).*c;

%...

for t=1:steps    
    if c>0
        %Calculate dy (i=2:end)
        %...
        %Update y
        %...
        %BC: periodic 
        %...
    else
        %Calculate dy (i=1:end-1)
        %...
        %Update y
        %...
        %BC: periodic
        %...
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
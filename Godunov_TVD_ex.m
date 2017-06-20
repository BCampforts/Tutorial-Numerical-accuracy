%Godunuv_TVD
%@Author: Benjamin C. 

close all
clc
clearvars
%% Inital conditions
dx=1;%2.5 1 0.5
sizeX=100;
x=1:dx:dx*round(sizeX/dx);
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
    % Compute High resolution fluxes      
    y_r=[y(2:end) y(end)];
    y_l=[y(1) y(1:end-1)];
    F_rh = (1/2)*c_lin.*(y+y_r) - (1/2)*(c_lin.^2).*(dt/dx).*(y_r-y);
    F_lh=  (1/2)*c_lin.*(y_l+y) - (1/2)*(c_lin.^2).*(dt/dx).*(y-y_l);
      
    % Compute fluxes 
     if c>0
        i=2:nb;
        
        F_rl=c_lin(i).*y(i);
        F_ll=c_lin(i).*y(i-1);      
        
        y_ext=[y(1) y(1:end-1)];
        r=%...;        
        r(isnan(r))=1;
        r(isinf(r))=1;
        
        %VANLEER
        phi = %...;
        phi_l=[phi(1) phi(1:end-1)];         
        phi_r=[phi(2:end) phi(end)]; 
        
        
        F_right = %...;
        F_left =%...;       
        
        y(i)= y(i)-dt*(F_right-F_left)/dx;
        
        %BC: periodic
        y(1)=y(end);
     else       
        i=1:nb-1;
        
        F_rl=c_lin(i).*y(i+1);
        F_ll=c_lin(i).*y(i);  
        
        y_ext=[y(2:end) y(end)];   
        r=%...;
        r(isnan(r))=1;
        r(isinf(r))=1;

        %VANLEER
        phi = %...;
        phi_l=[phi(1) phi(1:end-1)]; 
        
        
        F_right =%...;
        F_left = %...;       
        y(i)= y(i)-dt*(F_right-F_left)/dx;
        
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
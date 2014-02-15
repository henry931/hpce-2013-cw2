% Clear workspace (!)
clear all

%%%%%%%%%%%%%%%%%%%%%% Read in results %%%%%%%%%%%%%%%%%%%
% n
n = csvread('.\csv\p8_hgp10_fft_o.csv' , 1,3);
n = n(:,1);
% Inverted to get performance (1/time)
% 8 Cores
p8_fft = 1 ./ csvread('.\csv\p8_fft.csv' , 1,5);
p8_dft = 1 ./ csvread('.\csv\p8_dft.csv' , 1,5);
p8_hgp10_dft_p = 1 ./ csvread('.\csv\p8_hgp10_dft_p.csv' , 1,5);
p8_hgp10_fft_t = 1 ./ csvread('.\csv\p8_hgp10_fft_t.csv' , 1,5);
p8_hgp10_fft_p = 1 ./ csvread('.\csv\p8_hgp10_fft_p.csv' , 1,5);
p8_hgp10_fft_c = 1 ./ csvread('.\csv\p8_hgp10_fft_c.csv' , 1,5);
p8_hgp10_fft_o = 1 ./ csvread('.\csv\p8_hgp10_fft_o.csv' , 1,5);
% 7 Cores
p7_fft = 1 ./ csvread('.\csv\p7_fft.csv' , 1,5);
p7_dft = 1 ./ csvread('.\csv\p7_dft.csv' , 1,5);
p7_hgp10_dft_p = 1 ./ csvread('.\csv\p7_hgp10_dft_p.csv' , 1,5);
p7_hgp10_fft_t = 1 ./ csvread('.\csv\p7_hgp10_fft_t.csv' , 1,5);
p7_hgp10_fft_p = 1 ./ csvread('.\csv\p7_hgp10_fft_p.csv' , 1,5);
p7_hgp10_fft_c = 1 ./ csvread('.\csv\p7_hgp10_fft_c.csv' , 1,5);
p7_hgp10_fft_o = 1 ./ csvread('.\csv\p7_hgp10_fft_o.csv' , 1,5);
% 6 Cores
p6_fft = 1 ./ csvread('.\csv\p6_fft.csv' , 1,5);
p6_dft = 1 ./ csvread('.\csv\p6_dft.csv' , 1,5);
p6_hgp10_dft_p = 1 ./ csvread('.\csv\p6_hgp10_dft_p.csv' , 1,5);
p6_hgp10_fft_t = 1 ./ csvread('.\csv\p6_hgp10_fft_t.csv' , 1,5);
p6_hgp10_fft_p = 1 ./ csvread('.\csv\p6_hgp10_fft_p.csv' , 1,5);
p6_hgp10_fft_c = 1 ./ csvread('.\csv\p6_hgp10_fft_c.csv' , 1,5);
p6_hgp10_fft_o = 1 ./ csvread('.\csv\p6_hgp10_fft_o.csv' , 1,5);
% 5 Cores
p5_fft = 1 ./ csvread('.\csv\p5_fft.csv' , 1,5);
p5_dft = 1 ./ csvread('.\csv\p5_dft.csv' , 1,5);
p5_hgp10_dft_p = 1 ./ csvread('.\csv\p5_hgp10_dft_p.csv' , 1,5);
p5_hgp10_fft_t = 1 ./ csvread('.\csv\p5_hgp10_fft_t.csv' , 1,5);
p5_hgp10_fft_p = 1 ./ csvread('.\csv\p5_hgp10_fft_p.csv' , 1,5);
p5_hgp10_fft_c = 1 ./ csvread('.\csv\p5_hgp10_fft_c.csv' , 1,5);
p5_hgp10_fft_o = 1 ./ csvread('.\csv\p5_hgp10_fft_o.csv' , 1,5);
% 4 Cores
p4_fft = 1 ./ csvread('.\csv\p4_fft.csv' , 1,5);
p4_dft = 1 ./ csvread('.\csv\p4_dft.csv' , 1,5);
p4_hgp10_dft_p = 1 ./ csvread('.\csv\p4_hgp10_dft_p.csv' , 1,5);
p4_hgp10_fft_t = 1 ./ csvread('.\csv\p4_hgp10_fft_t.csv' , 1,5);
p4_hgp10_fft_p = 1 ./ csvread('.\csv\p4_hgp10_fft_p.csv' , 1,5);
p4_hgp10_fft_c = 1 ./ csvread('.\csv\p4_hgp10_fft_c.csv' , 1,5);
p4_hgp10_fft_o = 1 ./ csvread('.\csv\p4_hgp10_fft_o.csv' , 1,5);
% 3 Cores
p3_fft = 1 ./ csvread('.\csv\p3_fft.csv' , 1,5);
p3_dft = 1 ./ csvread('.\csv\p3_dft.csv' , 1,5);
p3_hgp10_dft_p = 1 ./ csvread('.\csv\p3_hgp10_dft_p.csv' , 1,5);
p3_hgp10_fft_t = 1 ./ csvread('.\csv\p3_hgp10_fft_t.csv' , 1,5);
p3_hgp10_fft_p = 1 ./ csvread('.\csv\p3_hgp10_fft_p.csv' , 1,5);
p3_hgp10_fft_c = 1 ./ csvread('.\csv\p3_hgp10_fft_c.csv' , 1,5);
p3_hgp10_fft_o = 1 ./ csvread('.\csv\p3_hgp10_fft_o.csv' , 1,5);
% 2 Cores
p2_fft = 1 ./ csvread('.\csv\p2_fft.csv' , 1,5);
p2_dft = 1 ./ csvread('.\csv\p2_dft.csv' , 1,5);
p2_hgp10_dft_p = 1 ./ csvread('.\csv\p2_hgp10_dft_p.csv' , 1,5);
p2_hgp10_fft_t = 1 ./ csvread('.\csv\p2_hgp10_fft_t.csv' , 1,5);
p2_hgp10_fft_p = 1 ./ csvread('.\csv\p2_hgp10_fft_p.csv' , 1,5);
p2_hgp10_fft_c = 1 ./ csvread('.\csv\p2_hgp10_fft_c.csv' , 1,5);
p2_hgp10_fft_o = 1 ./ csvread('.\csv\p2_hgp10_fft_o.csv' , 1,5);
% 1 Core
p1_fft = 1 ./ csvread('.\csv\p1_fft.csv' , 1,5);
p1_dft = 1 ./ csvread('.\csv\p1_dft.csv' , 1,5);
p1_hgp10_dft_p = 1 ./ csvread('.\csv\p1_hgp10_dft_p.csv' , 1,5);
p1_hgp10_fft_t = 1 ./ csvread('.\csv\p1_hgp10_fft_t.csv' , 1,5);
p1_hgp10_fft_p = 1 ./ csvread('.\csv\p1_hgp10_fft_p.csv' , 1,5);
p1_hgp10_fft_c = 1 ./ csvread('.\csv\p1_hgp10_fft_c.csv' , 1,5);
p1_hgp10_fft_o = 1 ./ csvread('.\csv\p1_hgp10_fft_o.csv' , 1,5);

%%%%%%%%%%%%%%%%% Weighted Results %%%%%%%%%%%%%%%%%%%%%%%%%% 

% DFT is weighted (multiplied by) n^2
% FFT is weighted (multiplied by) n.*log(n)
% Multiply not divide because we use inverse of time
% 8 Cores
p8_fft = p8_fft .* ( n(1:length(p8_fft)).*log2(n(1:length(p8_fft))) );
p8_dft = p8_dft .* n(1:length(p8_dft)).^2;
p8_hgp10_dft_p = p8_hgp10_dft_p .* n(1:length(p8_hgp10_dft_p)).^2;
p8_hgp10_fft_t = p8_hgp10_fft_t .* ( n(1:length(p8_hgp10_fft_t)).*log2(n(1:length(p8_hgp10_fft_t))) ); 
p8_hgp10_fft_p = p8_hgp10_fft_p .* ( n(1:length(p8_hgp10_fft_p)).*log2(n(1:length(p8_hgp10_fft_p))) );
p8_hgp10_fft_c = p8_hgp10_fft_c .* ( n(1:length(p8_hgp10_fft_c)).*log2(n(1:length(p8_hgp10_fft_c))) );
p8_hgp10_fft_o = p8_hgp10_fft_o .* ( n(1:length(p8_hgp10_fft_o)).*log2(n(1:length(p8_hgp10_fft_o))) );
% 7 Cores
p7_fft = p7_fft .* ( n(1:length(p7_fft)).*log2(n(1:length(p7_fft))) );
p7_dft = p7_dft .* n(1:length(p7_dft)).^2;
p7_hgp10_dft_p = p7_hgp10_dft_p .* n(1:length(p7_hgp10_dft_p)).^2;
p7_hgp10_fft_t = p7_hgp10_fft_t .* ( n(1:length(p7_hgp10_fft_t)).*log2(n(1:length(p7_hgp10_fft_t))) ); 
p7_hgp10_fft_p = p7_hgp10_fft_p .* ( n(1:length(p7_hgp10_fft_p)).*log2(n(1:length(p7_hgp10_fft_p))) );
p7_hgp10_fft_c = p7_hgp10_fft_c .* ( n(1:length(p7_hgp10_fft_c)).*log2(n(1:length(p7_hgp10_fft_c))) );
p7_hgp10_fft_o = p7_hgp10_fft_o .* ( n(1:length(p7_hgp10_fft_o)).*log2(n(1:length(p7_hgp10_fft_o))) );
% 6 Cores
p6_fft = p6_fft .* ( n(1:length(p6_fft)).*log2(n(1:length(p6_fft))) );
p6_dft = p6_dft .* n(1:length(p6_dft)).^2;
p6_hgp10_dft_p = p6_hgp10_dft_p .* n(1:length(p6_hgp10_dft_p)).^2;
p6_hgp10_fft_t = p6_hgp10_fft_t .* ( n(1:length(p6_hgp10_fft_t)).*log2(n(1:length(p6_hgp10_fft_t))) ); 
p6_hgp10_fft_p = p6_hgp10_fft_p .* ( n(1:length(p6_hgp10_fft_p)).*log2(n(1:length(p6_hgp10_fft_p))) );
p6_hgp10_fft_c = p6_hgp10_fft_c .* ( n(1:length(p6_hgp10_fft_c)).*log2(n(1:length(p6_hgp10_fft_c))) );
p6_hgp10_fft_o = p6_hgp10_fft_o .* ( n(1:length(p6_hgp10_fft_o)).*log2(n(1:length(p6_hgp10_fft_o))) );
% 5 Cores
p5_fft = p5_fft .* ( n(1:length(p5_fft)).*log2(n(1:length(p5_fft))) );
p5_dft = p5_dft .* n(1:length(p5_dft)).^2;
p5_hgp10_dft_p = p5_hgp10_dft_p .* n(1:length(p5_hgp10_dft_p)).^2;
p5_hgp10_fft_t = p5_hgp10_fft_t .* ( n(1:length(p5_hgp10_fft_t)).*log2(n(1:length(p5_hgp10_fft_t))) ); 
p5_hgp10_fft_p = p5_hgp10_fft_p .* ( n(1:length(p5_hgp10_fft_p)).*log2(n(1:length(p5_hgp10_fft_p))) );
p5_hgp10_fft_c = p5_hgp10_fft_c .* ( n(1:length(p5_hgp10_fft_c)).*log2(n(1:length(p5_hgp10_fft_c))) );
p5_hgp10_fft_o = p5_hgp10_fft_o .* ( n(1:length(p5_hgp10_fft_o)).*log2(n(1:length(p5_hgp10_fft_o))) );
% 4 Cores
p4_fft = p4_fft .* ( n(1:length(p4_fft)).*log2(n(1:length(p4_fft))) );
p4_dft = p4_dft .* n(1:length(p4_dft)).^2;
p4_hgp10_dft_p = p4_hgp10_dft_p .* n(1:length(p4_hgp10_dft_p)).^2;
p4_hgp10_fft_t = p4_hgp10_fft_t .* ( n(1:length(p4_hgp10_fft_t)).*log2(n(1:length(p4_hgp10_fft_t))) ); 
p4_hgp10_fft_p = p4_hgp10_fft_p .* ( n(1:length(p4_hgp10_fft_p)).*log2(n(1:length(p4_hgp10_fft_p))) );
p4_hgp10_fft_c = p4_hgp10_fft_c .* ( n(1:length(p4_hgp10_fft_c)).*log2(n(1:length(p4_hgp10_fft_c))) );
p4_hgp10_fft_o = p4_hgp10_fft_o .* ( n(1:length(p4_hgp10_fft_o)).*log2(n(1:length(p4_hgp10_fft_o))) );
% 3 Cores
p3_fft = p3_fft .* ( n(1:length(p3_fft)).*log2(n(1:length(p3_fft))) );
p3_dft = p3_dft .* n(1:length(p3_dft)).^2;
p3_hgp10_dft_p = p3_hgp10_dft_p .* n(1:length(p3_hgp10_dft_p)).^2;
p3_hgp10_fft_t = p3_hgp10_fft_t .* ( n(1:length(p3_hgp10_fft_t)).*log2(n(1:length(p3_hgp10_fft_t))) ); 
p3_hgp10_fft_p = p3_hgp10_fft_p .* ( n(1:length(p3_hgp10_fft_p)).*log2(n(1:length(p3_hgp10_fft_p))) );
p3_hgp10_fft_c = p3_hgp10_fft_c .* ( n(1:length(p3_hgp10_fft_c)).*log2(n(1:length(p3_hgp10_fft_c))) );
p3_hgp10_fft_o = p3_hgp10_fft_o .* ( n(1:length(p3_hgp10_fft_o)).*log2(n(1:length(p3_hgp10_fft_o))) );
% 2 Cores
p2_fft = p2_fft .* ( n(1:length(p2_fft)).*log2(n(1:length(p2_fft))) );
p2_dft = p2_dft .* n(1:length(p2_dft)).^2;
p2_hgp10_dft_p = p2_hgp10_dft_p .* n(1:length(p2_hgp10_dft_p)).^2;
p2_hgp10_fft_t = p2_hgp10_fft_t .* ( n(1:length(p2_hgp10_fft_t)).*log2(n(1:length(p2_hgp10_fft_t))) ); 
p2_hgp10_fft_p = p2_hgp10_fft_p .* ( n(1:length(p2_hgp10_fft_p)).*log2(n(1:length(p2_hgp10_fft_p))) );
p2_hgp10_fft_c = p2_hgp10_fft_c .* ( n(1:length(p2_hgp10_fft_c)).*log2(n(1:length(p2_hgp10_fft_c))) );
p2_hgp10_fft_o = p2_hgp10_fft_o .* ( n(1:length(p2_hgp10_fft_o)).*log2(n(1:length(p2_hgp10_fft_o))) );
% 1 Cores
p1_fft = p1_fft .* ( n(1:length(p1_fft)).*log2(n(1:length(p1_fft))) );
p1_dft = p1_dft .* n(1:length(p1_dft)).^2;
p1_hgp10_dft_p = p1_hgp10_dft_p .* n(1:length(p1_hgp10_dft_p)).^2;
p1_hgp10_fft_t = p1_hgp10_fft_t .* ( n(1:length(p1_hgp10_fft_t)).*log2(n(1:length(p1_hgp10_fft_t))) ); 
p1_hgp10_fft_p = p1_hgp10_fft_p .* ( n(1:length(p1_hgp10_fft_p)).*log2(n(1:length(p1_hgp10_fft_p))) );
p1_hgp10_fft_c = p1_hgp10_fft_c .* ( n(1:length(p1_hgp10_fft_c)).*log2(n(1:length(p1_hgp10_fft_c))) );
p1_hgp10_fft_o = p1_hgp10_fft_o .* ( n(1:length(p1_hgp10_fft_o)).*log2(n(1:length(p1_hgp10_fft_o))) );

%%%%%%%%%%%%%%%%%%%%%%% Get Averages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% And vectorise
fft = [mean(p1_fft),mean(p2_fft),mean(p3_fft),mean(p4_fft),mean(p5_fft),mean(p6_fft),mean(p7_fft),mean(p8_fft)];
dft = [mean(p1_dft),mean(p2_dft),mean(p3_dft),mean(p4_dft),mean(p5_dft),mean(p6_dft),mean(p7_dft),mean(p8_dft)];
hgp10_dft_p = [mean(p1_hgp10_dft_p),mean(p2_hgp10_dft_p),mean(p3_hgp10_dft_p),mean(p4_hgp10_dft_p),mean(p5_hgp10_dft_p),mean(p6_hgp10_dft_p),mean(p7_hgp10_dft_p),mean(p8_hgp10_dft_p)];
hgp10_fft_t = [mean(p1_hgp10_fft_t),mean(p2_hgp10_fft_t),mean(p3_hgp10_fft_t),mean(p4_hgp10_fft_t),mean(p5_hgp10_fft_t),mean(p6_hgp10_fft_t),mean(p7_hgp10_fft_t),mean(p8_hgp10_fft_t)];
hgp10_fft_p = [mean(p1_hgp10_fft_p),mean(p2_hgp10_fft_p),mean(p3_hgp10_fft_p),mean(p4_hgp10_fft_p),mean(p5_hgp10_fft_p),mean(p6_hgp10_fft_p),mean(p7_hgp10_fft_p),mean(p8_hgp10_fft_p)];
hgp10_fft_c = [mean(p1_hgp10_fft_c),mean(p2_hgp10_fft_c),mean(p3_hgp10_fft_c),mean(p4_hgp10_fft_c),mean(p5_hgp10_fft_c),mean(p6_hgp10_fft_c),mean(p7_hgp10_fft_c),mean(p8_hgp10_fft_c)];
hgp10_fft_o = [mean(p1_hgp10_fft_o),mean(p2_hgp10_fft_o),mean(p3_hgp10_fft_o),mean(p4_hgp10_fft_o),mean(p5_hgp10_fft_o),mean(p6_hgp10_fft_o),mean(p7_hgp10_fft_o),mean(p8_hgp10_fft_o)];

%Number of cores vector
P = 1:8;

% Normalise to base case
% Base case is standard fft with 1 core
constant = fft(1);
constant_dft = dft(1);
fft = fft ./ constant;
dft = dft ./ constant_dft;
hgp10_dft_p = hgp10_dft_p ./ constant_dft;
hgp10_fft_t = hgp10_fft_t ./ constant;
hgp10_fft_p = hgp10_fft_p ./ constant;
hgp10_fft_c = hgp10_fft_c ./ constant;
hgp10_fft_o = hgp10_fft_o ./ constant;

% Close any other plot windows
close all;

fig1 = figure;
plot(P,dft,P,hgp10_dft_p,'LineWidth',2);
title('Relative performance compared to DFT(1 Core) versus Processor count (Win 8.1, VC11, 64 bit, i7-4770k @ 4.2GHz)')
ylabel('Relative Performance / no units')
xlabel('Number of cores (p) utilised (Hyperthreaded)') 
legend('DFT', 'DFT Parfor')
legend('Location','NorthWest')
grid on

fig2 = figure;
plot(P,fft,P,hgp10_fft_t,P,hgp10_fft_p,P,hgp10_fft_c,P,hgp10_fft_o,'LineWidth',2);
title('Relative performance compared to FFT(1 Core) versus Processor count (Win 8.1, VC11, 64 bit, i7-4770k @ 4.2GHz)')
ylabel('Relative Performance / no units')
xlabel('Number of cores (p) utilised (Hyperthreaded)') 
legend('FFT', 'FFT Taskgroup', 'FFT Parfor', 'FFT Combined', 'FFT Opt')
legend('Location','NorthWest')
grid on
text(0,0,'*Note DFT and FFT cannot be directly compared as relative performance varies with n.')

print(fig1,'-dpdf','.\pdf\hgp10_scalability_dft.pdf')
print(fig2,'-dpdf','.\pdf\hgp10_scalability.pdf')

% Clear workspace (!)
clear all
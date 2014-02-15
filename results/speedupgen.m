% Clear workspace (!)
clear all

% Read in results
% A(:,1) selects n
% A(:,2) selects sentinel
% A(:,3) selects time
fft = csvread('.\csv\fft.csv' , 1,3);
dft = csvread('.\csv\dft.csv' , 1,3);
hgp10_dft_p = csvread('.\csv\hgp10_dft_p.csv' , 1,3);
hgp10_fft_t = csvread('.\csv\hgp10_fft_t.csv' , 1,3);
hgp10_fft_p = csvread('.\csv\hgp10_fft_p.csv' , 1,3);
hgp10_fft_c = csvread('.\csv\hgp10_fft_c.csv' , 1,3);
hgp10_fft_o = csvread('.\csv\hgp10_fft_o.csv' , 1,3);

% Close any other plot windows
close all;

% Get minimum window length
minlength = min([length(fft),length(dft),length(hgp10_dft_p),length(hgp10_fft_t),length(hgp10_fft_p),length(hgp10_fft_c),length(hgp10_fft_o)]);

% Calculate speedup
% fft is base case
for x = 1 : minlength
    n_all(x) = fft(x,1);
    r_dft(x) =  fft(x,3) / dft(x,3);
    r_hgp10_dft_p(x) = fft(x,3) / hgp10_dft_p(x,3);
    r_hgp10_fft_t(x) = fft(x,3) / hgp10_fft_t(x,3);
    r_hgp10_fft_p(x) = fft(x,3) / hgp10_fft_p(x,3);
    r_hgp10_fft_c(x) = fft(x,3) / hgp10_fft_c(x,3);
    r_hgp10_fft_o(x) = fft(x,3) / hgp10_fft_o(x,3);
end

fig1 = figure;
loglog(fft(:,1),fft(:,3),dft(:,1),dft(:,3),hgp10_dft_p(:,1),hgp10_dft_p(:,3),hgp10_fft_t(:,1),hgp10_fft_t(:,3),hgp10_fft_p(:,1),hgp10_fft_p(:,3),hgp10_fft_c(:,1),hgp10_fft_c(:,3),hgp10_fft_o(:,1),hgp10_fft_o(:,3),'LineWidth',2);
title('Execution Time versus FFT length (Win 8.1, VC11, 64 bit, i7-4770k @ 4.2GHz, All Cores)')
ylabel('Time (s)')
xlabel('FFT Length, n') 
legend('FFT', 'DFT', 'DFT Parfor', 'FFT Taskgroup', 'FFT Parfor', 'FFT Combined', 'FFT Opt')
legend('Location','SouthEast')
grid on

fig2 = figure;
loglog(n_all,r_dft,n_all,r_hgp10_dft_p,n_all,r_hgp10_fft_t,n_all,r_hgp10_fft_p,n_all,r_hgp10_fft_c,n_all,r_hgp10_fft_o,'LineWidth',2);
title('Speed relative to standard radix-2 FFT versus FFT length (Win 8.1, VC11, 64 bit, i7-4770k @ 4.2GHz, All Cores)')
ylabel('Ratio time(FFT)/time(Method)')
xlabel('FFT Length, n') 
legend('DFT', 'DFT Parfor', 'FFT Taskgroup', 'FFT Parfor', 'FFT Combined', 'FFT Opt')
legend('Location','SouthWest')
hr = refline(0,1);
set(hr,'Color','k')
grid on

print(fig1,'-dpdf','.\pdf\hgp10_time.pdf')
print(fig2,'-dpdf','.\pdf\hgp10_speedup.pdf')

% Clear workspace (!)
clear all
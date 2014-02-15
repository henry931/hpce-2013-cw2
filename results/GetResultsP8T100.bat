cd ..\

set P=8
set maxTime=100

.\bin\time_fourier_transform.exe hpce.fast_fourier_transform %P% %maxTime% > .\results\csv\fft.csv
.\bin\time_fourier_transform.exe hpce.direct_fourier_transform %P% %maxTime% > .\results\csv\dft.csv
.\bin\time_fourier_transform.exe hpce.hgp10.direct_fourier_transform_parfor %P% %maxTime% > .\results\csv\hgp10_dft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_taskgroup %P% %maxTime% > .\results\csv\hgp10_fft_t.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_parfor %P% %maxTime% > .\results\csv\hgp10_fft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_combined %P% %maxTime% > .\results\csv\hgp10_fft_c.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_opt %P% %maxTime% > .\results\csv\hgp10_fft_o.csv

echo Testing Complete
pause
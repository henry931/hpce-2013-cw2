cd ..\

set P=8
set maxTime=10

.\bin\time_fourier_transform.exe hpce.fast_fourier_transform %P% %maxTime% > .\results\csv\p8_fft.csv
.\bin\time_fourier_transform.exe hpce.direct_fourier_transform %P% %maxTime% > .\results\csv\p8_dft.csv
.\bin\time_fourier_transform.exe hpce.hgp10.direct_fourier_transform_parfor %P% %maxTime% > .\results\csv\p8_hgp10_dft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_taskgroup %P% %maxTime% > .\results\csv\p8_hgp10_fft_t.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_parfor %P% %maxTime% > .\results\csv\p8_hgp10_fft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_combined %P% %maxTime% > .\results\csv\p8_hgp10_fft_c.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_opt %P% %maxTime% > .\results\csv\p8_hgp10_fft_o.csv

set P=7

.\bin\time_fourier_transform.exe hpce.fast_fourier_transform %P% %maxTime% > .\results\csv\p7_fft.csv
.\bin\time_fourier_transform.exe hpce.direct_fourier_transform %P% %maxTime% > .\results\csv\p7_dft.csv
.\bin\time_fourier_transform.exe hpce.hgp10.direct_fourier_transform_parfor %P% %maxTime% > .\results\csv\p7_hgp10_dft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_taskgroup %P% %maxTime% > .\results\csv\p7_hgp10_fft_t.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_parfor %P% %maxTime% > .\results\csv\p7_hgp10_fft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_combined %P% %maxTime% > .\results\csv\p7_hgp10_fft_c.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_opt %P% %maxTime% > .\results\csv\p7_hgp10_fft_o.csv

set P=6

.\bin\time_fourier_transform.exe hpce.fast_fourier_transform %P% %maxTime% > .\results\csv\p6_fft.csv
.\bin\time_fourier_transform.exe hpce.direct_fourier_transform %P% %maxTime% > .\results\csv\p6_dft.csv
.\bin\time_fourier_transform.exe hpce.hgp10.direct_fourier_transform_parfor %P% %maxTime% > .\results\csv\p6_hgp10_dft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_taskgroup %P% %maxTime% > .\results\csv\p6_hgp10_fft_t.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_parfor %P% %maxTime% > .\results\csv\p6_hgp10_fft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_combined %P% %maxTime% > .\results\csv\p6_hgp10_fft_c.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_opt %P% %maxTime% > .\results\csv\p6_hgp10_fft_o.csv

set P=5

.\bin\time_fourier_transform.exe hpce.fast_fourier_transform %P% %maxTime% > .\results\csv\p5_fft.csv
.\bin\time_fourier_transform.exe hpce.direct_fourier_transform %P% %maxTime% > .\results\csv\p5_dft.csv
.\bin\time_fourier_transform.exe hpce.hgp10.direct_fourier_transform_parfor %P% %maxTime% > .\results\csv\p5_hgp10_dft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_taskgroup %P% %maxTime% > .\results\csv\p5_hgp10_fft_t.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_parfor %P% %maxTime% > .\results\csv\p5_hgp10_fft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_combined %P% %maxTime% > .\results\csv\p5_hgp10_fft_c.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_opt %P% %maxTime% > .\results\csv\p5_hgp10_fft_o.csv

set P=4

.\bin\time_fourier_transform.exe hpce.fast_fourier_transform %P% %maxTime% > .\results\csv\p4_fft.csv
.\bin\time_fourier_transform.exe hpce.direct_fourier_transform %P% %maxTime% > .\results\csv\p4_dft.csv
.\bin\time_fourier_transform.exe hpce.hgp10.direct_fourier_transform_parfor %P% %maxTime% > .\results\csv\p4_hgp10_dft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_taskgroup %P% %maxTime% > .\results\csv\p4_hgp10_fft_t.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_parfor %P% %maxTime% > .\results\csv\p4_hgp10_fft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_combined %P% %maxTime% > .\results\csv\p4_hgp10_fft_c.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_opt %P% %maxTime% > .\results\csv\p4_hgp10_fft_o.csv

set P=3

.\bin\time_fourier_transform.exe hpce.fast_fourier_transform %P% %maxTime% > .\results\csv\p3_fft.csv
.\bin\time_fourier_transform.exe hpce.direct_fourier_transform %P% %maxTime% > .\results\csv\p3_dft.csv
.\bin\time_fourier_transform.exe hpce.hgp10.direct_fourier_transform_parfor %P% %maxTime% > .\results\csv\p3_hgp10_dft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_taskgroup %P% %maxTime% > .\results\csv\p3_hgp10_fft_t.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_parfor %P% %maxTime% > .\results\csv\p3_hgp10_fft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_combined %P% %maxTime% > .\results\csv\p3_hgp10_fft_c.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_opt %P% %maxTime% > .\results\csv\p3_hgp10_fft_o.csv

set P=2

.\bin\time_fourier_transform.exe hpce.fast_fourier_transform %P% %maxTime% > .\results\csv\p2_fft.csv
.\bin\time_fourier_transform.exe hpce.direct_fourier_transform %P% %maxTime% > .\results\csv\p2_dft.csv
.\bin\time_fourier_transform.exe hpce.hgp10.direct_fourier_transform_parfor %P% %maxTime% > .\results\csv\p2_hgp10_dft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_taskgroup %P% %maxTime% > .\results\csv\p2_hgp10_fft_t.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_parfor %P% %maxTime% > .\results\csv\p2_hgp10_fft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_combined %P% %maxTime% > .\results\csv\p2_hgp10_fft_c.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_opt %P% %maxTime% > .\results\csv\p2_hgp10_fft_o.csv

set P=1

.\bin\time_fourier_transform.exe hpce.fast_fourier_transform %P% %maxTime% > .\results\csv\p1_fft.csv
.\bin\time_fourier_transform.exe hpce.direct_fourier_transform %P% %maxTime% > .\results\csv\p1_dft.csv
.\bin\time_fourier_transform.exe hpce.hgp10.direct_fourier_transform_parfor %P% %maxTime% > .\results\csv\p1_hgp10_dft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_taskgroup %P% %maxTime% > .\results\csv\p1_hgp10_fft_t.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_parfor %P% %maxTime% > .\results\csv\p1_hgp10_fft_p.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_combined %P% %maxTime% > .\results\csv\p1_hgp10_fft_c.csv
.\bin\time_fourier_transform.exe hpce.hgp10.fast_fourier_transform_opt %P% %maxTime% > .\results\csv\p1_hgp10_fft_o.csv

echo Testing Complete
pause
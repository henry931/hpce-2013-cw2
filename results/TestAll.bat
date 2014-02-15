cd ..\

.\bin\test_fourier_transform.exe hpce.fast_fourier_transform
.\bin\test_fourier_transform.exe hpce.direct_fourier_transform
.\bin\test_fourier_transform.exe hpce.hgp10.direct_fourier_transform_parfor
.\bin\test_fourier_transform.exe hpce.hgp10.fast_fourier_transform_taskgroup
.\bin\test_fourier_transform.exe hpce.hgp10.fast_fourier_transform_parfor
.\bin\test_fourier_transform.exe hpce.hgp10.fast_fourier_transform_combined
.\bin\test_fourier_transform.exe hpce.hgp10.fast_fourier_transform_opt

echo Testing Complete
pause
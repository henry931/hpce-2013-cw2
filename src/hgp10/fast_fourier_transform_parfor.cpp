#include "fourier_transform.hpp"
#include "tbb/parallel_for.h"
#include <cmath>
#include <cassert>

namespace hpce
{
	namespace hgp10
	{

		class fast_fourier_transform_parfor
			: public fourier_transform
		{
		protected:
			/* Standard radix-2 FFT only supports binary power lengths */
			virtual size_t calc_padded_size(size_t n) const
			{
				assert(n!=0);

				size_t ret=1;
				while(ret<n){
					ret<<=1;
				}

				return ret;
			}

			virtual void forwards_impl(
				size_t n,	const std::complex<double> &wn,
				const std::complex<double> *pIn, size_t sIn,
				std::complex<double> *pOut, size_t sOut
				) const 
			{
				assert(n>0);

				if (n == 1){
					pOut[0] = pIn[0];
				}else if (n == 2){
					pOut[0] = pIn[0]+pIn[sIn];
					pOut[sOut] = pIn[0]-pIn[sIn];
				}else{
					size_t m = n/2;

					forwards_impl(m,wn*wn,pIn,2*sIn,pOut,sOut);
					forwards_impl(m,wn*wn,pIn+sIn,2*sIn,pOut+sOut*m,sOut);

					// K is the number of inner loops to use.
					// Decreasing K increases parallelism
					// Fastest on this machine;
					size_t K = 1024;

					// At some point m will reach K
					// So we need to make K track it
					while ( K > m) {
						// Use inner loop
						K = K / 2;

						// Use outer (parfor) loop
						// Much slower
						//K = 1;
					}

					tbb::parallel_for<size_t>(0u, m/K, 1, [=](size_t j0){

						//<Code to set w to the correct value for j=j0*K >
						std::complex<double> w = std::pow( wn, (double)(j0)*(double)(K) );

						for (size_t j1=0; j1<K; j1++){

							size_t j=j0*K+j1;  // Recover original loop variable

							// <Original loop body>
							std::complex<double> t1 = w*pOut[m+j];
							std::complex<double> t2 = pOut[j]-t1;
							pOut[j] = pOut[j]+t1;                 /*  pOut[j] = pOut[j] + w^i pOut[m+j] */
							pOut[j+m] = t2;                          /*  pOut[j] = pOut[j] - w^i pOut[m+j] */
							w = w*wn;

						}

					});

				}
			}

			virtual void backwards_impl(
				size_t n,	const std::complex<double> &wn,
				const std::complex<double> *pIn, size_t sIn,
				std::complex<double> *pOut, size_t sOut
				) const 
			{
				complex_t reverse_wn=1.0/wn;
				forwards_impl(n, reverse_wn, pIn, sIn, pOut, sOut);

				double scale=1.0/n;
				for(size_t i=0;i<n;i++){
					pOut[i]=pOut[i]*scale;
				}
			}

		public:
			virtual std::string name() const
			{ return "hpce.hgp10.fast_fourier_transform_parfor"; }

			virtual bool is_quadratic() const
			{ return false; }
		};

		std::shared_ptr<fourier_transform> Create_fast_fourier_transform_parfor()
		{
			return std::make_shared<fast_fourier_transform_parfor>();
		}

	}// namespace hgp10

}; // namespace hpce

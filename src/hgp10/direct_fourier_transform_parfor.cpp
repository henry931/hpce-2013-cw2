#include "fourier_transform.hpp"
#include <cmath>
#include <cassert>
#include "tbb/parallel_for.h"

namespace hpce
{
	namespace hgp10
	{
		class direct_fourier_transform_parfor
			: public fourier_transform
		{

		protected:
			/*! We can do any size transform */
			virtual size_t calc_padded_size(size_t n) const
			{
				return n;
			}

			virtual void forwards_impl(
				size_t n,	const std::complex<double> &/*wn*/,
				const std::complex<double> *pIn, size_t sIn,
				std::complex<double> *pOut, size_t sOut
				) const 
			{

				assert(n>0);

				const double PI=3.1415926535897932384626433832795;

				// = -i*2*pi / n
				complex_t neg_im_2pi_n=-complex_t(0.0, 1.0)*2.0*PI / (double)n;

				// Run outer loop possibly in parallel
				tbb::parallel_for<size_t>(0u, n, 1, [=](size_t kk){

					complex_t acc=0;
					for(size_t ii=0;ii<n;ii++){
						// acc += exp(-i * 2 * pi * kk / n);
						acc+=pIn[ii*sIn] * exp( neg_im_2pi_n * (double)kk * (double)ii );
					}
					pOut[kk*sOut]=acc;

				});

			}

			virtual void backwards_impl(
				size_t n,	const std::complex<double> &/*wn*/,
				const std::complex<double> *pIn, size_t sIn,
				std::complex<double> *pOut, size_t sOut
				) const 
			{
				assert(n>0);

				const double PI=3.1415926535897932384626433832795;

				// = i*2*pi / n
				complex_t im_2pi_n=complex_t(0.0, 1.0)*2.0*PI / (double)n;

				const double scale=1.0/n;

				tbb::parallel_for<size_t>(0u, n, 1, [=](size_t kk){
					complex_t acc=0;
					for(size_t ii=0;ii<n;ii++){
						// acc += exp(i * 2 * pi * kk / n);
						acc+=pIn[ii*sIn] * exp( im_2pi_n * (double)kk * (double)ii );
					}
					pOut[kk*sOut]=acc*scale;
				});
			}

		public:
			virtual std::string name() const
			{ return "hpce.hgp10.direct_fourier_transform_parfor"; }

			virtual bool is_quadratic() const
			{ return true; }
		};

		std::shared_ptr<fourier_transform> Create_direct_fourier_transform_parfor()
		{
			return std::make_shared<direct_fourier_transform_parfor>();
		}

	}; // namespace hgp10

}; // namespace hpce

#include "fourier_transform.hpp"

#include <cmath>
#include <cassert>
#include "tbb/task_group.h"

namespace hpce
{
	namespace hgp10
	{
		class fast_fourier_transform_taskgroup_opt
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
				}else if (n == 4){

					// Basically just copied the rest of the program and simplified
					// So this is now the base case
					std::complex<double> temp;

					pOut[0] = pIn[0]+pIn[2*sIn];
					pOut[sOut] = pIn[0]-pIn[2*sIn];

					(pOut+sOut*2)[0] = (pIn+sIn)[0]+(pIn+sIn)[2*sIn];
					(pOut+sOut*2)[sOut] = (pIn+sIn)[0]-(pIn+sIn)[2*sIn];

					temp = pOut[0]-pOut[2];

					pOut[0] = pOut[0]+pOut[2];
					pOut[2] = temp;

					temp = pOut[1]-wn*pOut[3];

					pOut[1] = pOut[1]+wn*pOut[3]; 
					pOut[3] = temp;

				}else if (n == 8){

					// n == 4 implementations

					// First Half
					std::complex<double> temp;

					pOut[0] = pIn[0]+pIn[4*sIn];
					pOut[sOut] = pIn[0]-pIn[4*sIn];

					(pOut+sOut*2)[0] = (pIn+2*sIn)[0]+(pIn+2*sIn)[4*sIn];
					(pOut+sOut*2)[sOut] = (pIn+2*sIn)[0]-(pIn+2*sIn)[4*sIn];

					temp = pOut[0]-pOut[2];

					pOut[0] = pOut[0]+pOut[2];
					pOut[2] = temp;

					temp = pOut[1]-wn*wn*pOut[3];

					pOut[1] = pOut[1]+wn*wn*pOut[3]; 
					pOut[3] = temp;

					// Second Half
					(pOut+sOut*4)[0] = (pIn+sIn)[0]+(pIn+sIn)[4*sIn];
					(pOut+sOut*4)[sOut] = (pIn+sIn)[0]-(pIn+sIn)[4*sIn];

					(pOut+sOut*6)[0] = (pIn+3*sIn)[0]+(pIn+3*sIn)[4*sIn];
					(pOut+sOut*6)[sOut] = (pIn+3*sIn)[0]-(pIn+3*sIn)[4*sIn];

					temp = (pOut+sOut*4)[0]-(pOut+sOut*4)[2];

					(pOut+sOut*4)[0] = (pOut+sOut*4)[0]+(pOut+sOut*4)[2];
					(pOut+sOut*4)[2] = temp;

					temp = (pOut+sOut*4)[1]-wn*wn*(pOut+sOut*4)[3];

					(pOut+sOut*4)[1] = (pOut+sOut*4)[1]+wn*wn*(pOut+sOut*4)[3]; 
					(pOut+sOut*4)[3] = temp;

					// Unrolled for loop
					temp = pOut[0]-pOut[4];

					pOut[0] = pOut[0]+pOut[4];
					pOut[4] = temp;

					temp = pOut[1]-wn*pOut[5];

					pOut[1] = pOut[1]+wn*pOut[5];
					pOut[5] = temp;

					temp = pOut[2]-wn*wn*pOut[6];

					pOut[2] = pOut[2]+ wn*wn*pOut[6];
					pOut[6] = temp;

					temp = pOut[3]-wn*wn*wn*pOut[7];

					pOut[3] = pOut[3]+wn*wn*wn*pOut[7];
					pOut[7] = temp;

				}else{
					size_t m = n/2;

					// Create new group
					tbb::task_group group;

					// Run first half of forward process
					group.run( [&](){
						forwards_impl(m,wn*wn,pIn,2*sIn,pOut,sOut);
					});

					// Run second half of forward process
					// Possibly in parallel
					group.run( [&](){
						forwards_impl(m,wn*wn,pIn+sIn,2*sIn,pOut+sOut*m,sOut);
					});

					// Merge tasks
					group.wait();

					std::complex<double> w=std::complex<double>(1.0, 0.0);

					for (size_t j=0;j<m;j++){
						std::complex<double> t1 = w*pOut[m+j];
						std::complex<double> t2 = pOut[j]-t1;
						pOut[j] = pOut[j]+t1;                 /*  pOut[j] = pOut[j] + w^i pOut[m+j] */
						pOut[j+m] = t2;                          /*  pOut[j] = pOut[j] - w^i pOut[m+j] */
						w = w*wn;
					}
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
			{ return "hpce.hgp10.fast_fourier_transform_taskgroup_opt"; }

			virtual bool is_quadratic() const
			{ return false; }
		};

		std::shared_ptr<fourier_transform> Create_fast_fourier_transform_taskgroup_opt()
		{
			return std::make_shared<fast_fourier_transform_taskgroup_opt>();
		}

	}; // namespace hgp10

}; // namespace hpce

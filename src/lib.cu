#include <stdio.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>
#include <helper_cuda.h>
#include <lib.cuh>

__global__ void kernel(int* a, int* b) {
	a[threadIdx.x] += b[threadIdx.x];
}

int kernelWrapper(int* a, int* b, const unsigned int length) {
	checkCudaErrors(cudaSetDevice(0));
	int* ad;
	int* bd;
	const unsigned int intSize = length * sizeof(int);
	
	checkCudaErrors(cudaMalloc((void**)&ad, intSize));
	checkCudaErrors(cudaMalloc((void**)&bd, intSize));
	checkCudaErrors(cudaMemcpy(ad, a, intSize, cudaMemcpyHostToDevice));
	checkCudaErrors(cudaMemcpy(bd, b, intSize, cudaMemcpyHostToDevice));
	
	dim3 dimBlock(length, 1);
	dim3 dimGrid(1, 1);
	kernel<<<dimGrid, dimBlock>>>(ad, bd);
	checkCudaErrors(cudaGetLastError());
	checkCudaErrors(cudaDeviceSynchronize()); 
	checkCudaErrors(cudaMemcpy(a, ad, intSize, cudaMemcpyDeviceToHost));
	checkCudaErrors(cudaFree(ad));
	checkCudaErrors(cudaFree(bd));
	printf("%s\n", a);
	return 0;
}
#include <gtest/gtest.h>
#include <lib.cuh>
TEST(kernelWrapper, AddsArrays) {
	const unsigned int length = 10;
	int a[length] = {0,1,2,3,4,5,6,7,8,9};
	int b[length] = {9,8,7,6,5,4,3,2,1,0};
	kernelWrapper((int*) &a, (int*) &b, length);
	EXPECT_EQ(a[0], 9);
	EXPECT_EQ(a[1], 9);
	EXPECT_EQ(a[2], 9);
	EXPECT_EQ(a[3], 9);
	EXPECT_EQ(a[4], 9);
	EXPECT_EQ(a[5], 9);
	EXPECT_EQ(a[6], 9);
	EXPECT_EQ(a[7], 9);
	EXPECT_EQ(a[8], 9);
	EXPECT_EQ(a[9], 9);
}
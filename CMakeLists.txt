cmake_minimum_required(VERSION 3.1.0 FATAL_ERROR)
set(PROJECT_NAME "cuda-gtest-cmake-template")
project(${PROJECT_NAME})
set(LIB_VERSION "0.0.0.${BUILD_NUMBER}")
if($ENV{BUILD_NUMBER})
	set(BUILD_NUMBER $ENV{BUILD_NUMBER})
else()
	set(BUILD_NUMBER 0)
endif()
set(PROJECT_README "${PROJECT_NAME} is an example of a project consisting of a library and gtests for it using cmake to put it all together.")
option(TESTS_ENABLED "Enable tests build" ON)
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /MT")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /MTd")
add_subdirectory(src)
if(TESTS_ENABLED)
	add_subdirectory(test)
endif()
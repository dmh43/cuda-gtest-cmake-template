A simple example demonstrating gtest integration in a cmake CUDA project.

How to run:
You need CUDA installed
You need SVN command line tools installed.
Go into the build directory and type: cmake ..
Open the created solution file in Visual Studio
Build all the projects.
Set the gtest_lib project as the start project, and Ctrl+F5.

How it works (on Windows):
cmake will create a solution file for VS. Inside it will be 3 projects excluding ALL_BUILD and ZERO_CHECK. Those projects are gtest, lib_gtest, lib. gtest is the google test library downloaded using SVN, lib_gtest is a gtest test that tests the single kernel wrapper function exposed in lib. lib is just a cuda library project that contains a single kernel and kernel wrapper that adds int arrays together.

When you build the projects, the test will be compiled into an executable that uses the gtest library, and lib library. When you run this executable it runs the test and shows you the pass/fail (assuming you Ctrl+F5 so the console doesn't go away after the executable finishes).

Some notes:
You may have to change the paths of where the CUDA includes are located. One is the CUDA install directory, and the other is where the helper cuda includes are (or you could just move the helper cuda includes into the project).
Maybe ctest can be used so there is more integration with cmake/CI tools?
You can turn off the tests by doing cmake -DTEST_ENABLED=OFF ..

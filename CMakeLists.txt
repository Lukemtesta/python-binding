#Run via command line: cmake .. -G "Visual Studio 14 2015 Win64" -DCMAKE_BUILD_TYPE=RELEASE

cmake_minimum_required(VERSION 3.5)

project(language_binding)

# Setup flags for swig binding
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y -Wall -fPIC")

# add modules
add_subdirectory(liba)
add_subdirectory(swig-example)


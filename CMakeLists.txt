#Run via command line: cmake .. -G "Visual Studio 14 2015 Win64" -DCMAKE_BUILD_TYPE=RELEASE

cmake_minimum_required(VERSION 3.5)

# Setup flags for swig binding
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y -Wall -fPIC")

# add modules
add_subdirectory(liba)
add_subdirectory(swig-example)

option(BUILD_BINDINGS "Build external SWIG module" OFF)

if(BUILD_BINDINGS)
    add_subdirectory(external/swig)
endif()

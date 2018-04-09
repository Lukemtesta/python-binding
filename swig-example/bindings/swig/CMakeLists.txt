
# https://cmake.org/cmake/help/v3.0/module/FindPythonLibs.html
cmake_minimum_required( VERSION 2.7 )

# Set up swig
find_package(SWIG REQUIRED)

include(${SWIG_USE_FILE})

# Add subdirectories for each language if desired
option(BUILD_PYTHON "Build Python SWIG module" ON)
option(BUILD_PERL "Build Perl SWIG module" OFF)

if(BUILD_PYTHON)
    add_subdirectory(python)
endif()

if(BUILD_PERL)
    add_subdirectory(perl)
endif()
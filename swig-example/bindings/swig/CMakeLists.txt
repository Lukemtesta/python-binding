
# https://cmake.org/cmake/help/v3.0/module/FindPythonLibs.html
cmake_minimum_required( VERSION 2.7 )

# Set up swig
find_package(SWIG REQUIRED)

include(${SWIG_USE_FILE})

# Include cmake binding functions
file(GLOB_RECURSE CMAKE_FUNCTIONS "functions/*.cmake")

# CMake doesn't support include multiple CMake execution files
foreach( FUNCTION_FILE ${CMAKE_FUNCTIONS} )
	include( ${FUNCTION_FILE} )
endforeach()


option(BUILD_PYTHON "Build Python SWIG module" ON)
option(BUILD_PERL "Build Perl SWIG module" OFF)

if(BUILD_PYTHON)
    add_bindings_python(${PROJECT_NAME} ${PROJECT_NAME}.i ${CMAKE_SOURCE_DIR}/${PROJECT_NAME})
endif()

if(BUILD_PERL)
    add_bindings_perl(${PROJECT_NAME} ${PROJECT_NAME}.i ${CMAKE_SOURCE_DIR}/${PROJECT_NAME})
endif()
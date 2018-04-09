#Run via command line: cmake .. -G "Visual Studio 14 2015 Win64" -DCMAKE_BUILD_TYPE=RELEASE

cmake_minimum_required(VERSION 3.5)

project(swig-example)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y -Wall -fPIC")

# Locate header and source files
file(GLOB HDR_LIBA ${CMAKE_SOURCE_DIR} "liba/*.h")
file(GLOB SRC_LIBA ${CMAKE_SOURCE_DIR} "liba/*.cpp")
file(GLOB HDR_SWIG_EXAMPLE ${CMAKE_SOURCE_DIR} "${PROJECT_NAME}/*.h")
file(GLOB SRC_SWIG_EXAMPLE ${CMAKE_SOURCE_DIR} "${PROJECT_NAME}/*.cpp;")

# Create module and add files in IDE for liba and swig_example
add_library(EXTERNAL_LIBRARY_A ${SRC_LIBA} ${HDR_LIBA})
add_library(${PROJECT_NAME} ${SRC_SWIG_EXAMPLE} ${HDR_SWIG_EXAMPLE})

# Set up public headers for liba and swig-example
set_target_properties(EXTERNAL_LIBRARY_A PROPERTIES LINKER_LANGUAGE CXX)
set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)

# Create main and link to liba
target_link_libraries(${PROJECT_NAME} ${HDR_SWIG_EXAMPLE})

# Add install target
install(TARGETS ${PROJECT_NAME} EXTERNAL_LIBRARY_A
		RUNTIME DESTINATION bin
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib/static)

option(BUILD_BINDINGS "Build external SWIG module" OFF)

if(BUILD_BINDINGS)
    add_subdirectory(external/swig)
endif()

#Run via command line: cmake .. -G "Visual Studio 14 2015 Win64" -DCMAKE_BUILD_TYPE=RELEASE

cmake_minimum_required(VERSION 3.5)

project(swig-example)

# Locate header and source files
file(GLOB HDR_FILES ${CMAKE_SOURCE_DIR} "*.h")
file(GLOB SRC_FILES ${CMAKE_SOURCE_DIR} "*.cpp")

# Point to external header files 
include_directories(${CMAKE_SOURCE_DIR}/liba)

# Create module and add files in IDE for liba and swig_example
add_library(${PROJECT_NAME} ${HDR_FILES} ${SRC_FILES})

# Set up public headers for liba and swig-example
set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)

# Create main and link to liba
target_link_libraries(${PROJECT_NAME} liba)

# Add install target
install(TARGETS ${PROJECT_NAME}
		RUNTIME DESTINATION bin
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib/static)
			
option(BUILD_BINDINGS "Build external SWIG module" OFF)
			
if(BUILD_BINDINGS)
    add_subdirectory(bindings/swig)
endif()

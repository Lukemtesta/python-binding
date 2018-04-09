#Run via command line: cmake .. -G "Visual Studio 14 2015 Win64" -DCMAKE_BUILD_TYPE=RELEASE

cmake_minimum_required(VERSION 3.5)

project(liba)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y -Wall -fPIC")

# Locate header and source files
file(GLOB HDR_FILES ${CMAKE_SOURCE_DIR} "*.h")
file(GLOB SRC_FILES ${CMAKE_SOURCE_DIR} "*.cpp")

# Create module and add files in IDE for liba and swig_example
add_library(${PROJECT_NAME} ${HDR_FILES} ${SRC_FILES} ${EXTERNAL_HDR_FILES})

# Set up public headers for liba and swig-example
set_target_properties(${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)

# Create main and link to liba
target_link_libraries(${PROJECT_NAME} ${HDR_FILES})

# Add install target
install(TARGETS ${PROJECT_NAME}
		RUNTIME DESTINATION bin
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib/static)

#Run via command line: cmake .. -G "Visual Studio 14 2015 Win64" -DCMAKE_BUILD_TYPE=RELEASE

# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at

  # http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

cmake_minimum_required(VERSION 3.5)

project(swig_example)

# Locate header and source files
file(GLOB_RECURSE HDR_FILES ${CMAKE_SOURCE_DIR} "*.h")
file(GLOB_RECURSE SRC_FILES ${CMAKE_SOURCE_DIR} "*.cpp")

# Point to external header files 
include_directories("${CMAKE_SOURCE_DIR}/liba/third party")

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

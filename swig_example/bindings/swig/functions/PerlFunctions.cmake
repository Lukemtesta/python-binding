# If CMake not auto-pointing to PerlLibs set...
# -DPERL_INCLUDE_DIR=<perl path>\include 
# -DPERL_LIBRARY=<perl path>\lib

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

function (
	add_bindings_perl
	TARGET_PROJECT_NAME 
	INTERFACE_FILES
	EXTERNAL_INCLUDE_DIRS
	EXTERNAL_LIBS
	PREPROCESSOR_DEFINES)
	
	# Setup flags for swig binding
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++1y -Wall -fPIC")

	# Locate swig and python dependencies
	find_package(SWIG REQUIRED)
	find_package(PerlLibs REQUIRED)
	
	set(CMAKE_SWIG_FLAGS "")

	# Add swig CMake functions
	include(${SWIG_USE_FILE})

	# swig interface file containing the C/C++ function signatures to link against
	add_definitions(${PREPROCESSOR_DEFINES})
	set_source_files_properties(${INTERFACE_FILES} PROPERTIES CPLUSPLUS ON)

	# Add directory holding .h files to editors external include directory list
	include_directories(${PYTHON_INCLUDE_PATH} ${EXTERNAL_INCLUDE_DIRS})

	# SWIG_ADD_MODULE(name language [ files ]) - creates a swig module (project) for the given name, 
	# in the format _{filename}, targetting the specified language. Links against the interface file .i
	# Expected interface file: <solution filename>.i
	swig_add_module(${TARGET_PROJECT_NAME} perl ${INTERFACE_FILES})

	# SWIG_LINK_LIBRARIES(name [ libraries ]) link the swig module (project) against external 
	# dependencies (.lib)
	swig_link_libraries(${TARGET_PROJECT_NAME} ${TARGET_PROJECT_NAME} ${EXTERNAL_LIBS} ${PERL_LIBRARIES})
	
	# Copy auto-generated script to lib directory
	add_custom_command(
		TARGET "_${TARGET_PROJECT_NAME}" 
		POST_BUILD
		COMMAND ${CMAKE_COMMAND} -E copy ${PROJECT_BINARY_DIR}/bindings/swig/${TARGET_PROJECT_NAME}.perl $<TARGET_FILE_DIR:_${TARGET_PROJECT_NAME}>)

endfunction(add_bindings_perl)
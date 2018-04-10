# If CMake not auto-pointing to PythonLibs set...
# -DPYTHON_INCLUDE_DIR=<python path>\include 
# -DPYTHON_LIBRARY=<python path>\lib

function(
	add_bindings_python
	TARGET_PROJECT_NAME
	INTERFACE_FILES
	EXTERNAL_INCLUDE_DIRS)

	# Include python
	find_package(PythonLibs REQUIRED)

	set(CMAKE_SWIG_FLAGS "")

	# swig interface file containing the C/C++ function signatures to link against
	set_source_files_properties(${INTERFACE_FILES} PROPERTIES CPLUSPLUS ON)

	# Add directory holding .h files to editors external include directory list
	include_directories(${PYTHON_INCLUDE_PATH} ${EXTERNAL_INCLUDE_DIRS})

	# SWIG_ADD_MODULE(name language [ files ]) - creates a swig module (project) for the given name, 
	# in the format _{filename}, targetting the specified language. Links against the interface file .i
	# Expected interface file: <solution filename>.i
	swig_add_module(${TARGET_PROJECT_NAME} python ${INTERFACE_FILES})

	# SWIG_LINK_LIBRARIES(name [ libraries ]) link the swig module (project) against external 
	# dependencies (.lib)
	swig_link_libraries(${TARGET_PROJECT_NAME} ${TARGET_PROJECT_NAME} ${PYTHON_LIBRARIES})

endfunction(add_bindings_python)
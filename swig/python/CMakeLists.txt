# Include python
find_package(PythonLibs REQUIRED)

set(CMAKE_SWIG_FLAGS "")

# swig interface file containing the C/C++ function signatures to link against
set_source_files_properties(../${PROJECT_NAME}.i PROPERTIES CPLUSPLUS ON)

# Add directory holding .h files to editors external include directory list
include_directories(../..)
include_directories(${PYTHON_INCLUDE_PATH})

# SWIG_ADD_MODULE(name language [ files ]) - creates a swig module (project) for the given name, 
# in the format _{filename}, targetting the specified language. Links against the interface file .i
swig_add_module(${PROJECT_NAME} python ../${PROJECT_NAME}.i)

# SWIG_LINK_LIBRARIES(name [ libraries ]) link the swig module (project) against external 
# dependencies (.lib)
swig_link_libraries(${PROJECT_NAME} ${PROJECT_NAME} ${PYTHON_LIBRARIES})

# Post build event to copy auto-generated 
add_custom_command(
TARGET _swig_example 
POST_BUILD
COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.py ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.py
)
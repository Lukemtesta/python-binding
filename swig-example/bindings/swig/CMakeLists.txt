
cmake_minimum_required( VERSION 3.5 )


# Include cmake binding functions
file(GLOB_RECURSE CMAKE_FUNCTIONS "functions/*.cmake")

# CMake doesn't support include multiple CMake execution files in a single include call
foreach( FUNCTION_FILE ${CMAKE_FUNCTIONS} )
	include( ${FUNCTION_FILE} )
endforeach()

# Set target project properties
set(EXTERNAL_INCLUDE_DIR "${CMAKE_SOURCE_DIR}/${PROJECT_NAME}/third party")
set(EXTERNAL_LIBS " ")
set(PREPROCESSOR_DEFINES " ")

# Optional bindings
option(BUILD_PYTHON "Build Python SWIG module" ON)
option(BUILD_PERL "Build Perl SWIG module" OFF)

if(BUILD_PYTHON)
    add_bindings_python(
	${PROJECT_NAME} 
	${PROJECT_NAME}.i 
	${EXTERNAL_INCLUDE_DIR} 
	${EXTERNAL_LIBS} 
	${PREPROCESSOR_DEFINES})
endif()

if(BUILD_PERL)
    add_bindings_perl(
	${PROJECT_NAME} 
	${PROJECT_NAME}.i 
	${EXTERNAL_INCLUDE_DIR} 
	${EXTERNAL_LIBS} 
	${PREPROCESSOR_DEFINES})
endif()
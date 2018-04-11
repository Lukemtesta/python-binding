// This module is exported into a swig_example.py file to be loaded, but compiled against _swig_example.lib
// see http://www.swig.org/papers/PyTutorial98/PyTutorial98.pdf
%module swig_example

// Bindings for python to understand object signature and treat as non-generic *
%include "std_vector.i"
%include "std_string.i"
%include "cstring.i"
%include "stdint.i"
%include "inttypes.i"
%include "stl.i"
%include "shared_ptr.i"
%include "pointer.i"

// Include %windows.i to interprete non-C++ standard keywords on windows i.e. __stdcall, _declspec

// Defines the wrapper python uses to convert template type to python object
namespace std
{
	// re-define dll export tag for sake of getting past swig pre-compilation checks
	// Still requires PREPROCESSORS to be defined in bindings project i.e. ifdef API_ENABLED #define ...
    %define SHARED_DLL_API_TAG %enddef

	%template(vectori) vector<int>;
	%template(vectord) vector<double>;
}

// Add necessary symbols to generated header
// Swig does not have recursive include - Must specify all python export targets
%{
#include "swig-example.h"
%}

// Wrapper function declarations may be included here from external .i, or defined here
%inline
%{
	std::vector<double> example_initialise_wrapper(std::int32_t i_count)
	{
		return std::vector<double>(i_count, 0);
	}
%}

// Enforce access by value: %naturalvar Test::method
// Process symbols in header
%include "swig-example.h"

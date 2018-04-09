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

// Defines the wrapper python uses to convert template type to python object
namespace std
{
	// re-define dll export tag as nothing to allow compilation 
    %define SHARED_DLL_API_TAG %enddef

	%template(vectori) vector<int>;
	%template(vectord) vector<double>;
}

// Add necessary symbols to generated header
%{
#include "swig-example.h"
%}

// Enforce access by value: %naturalvar Test::method
// Process symbols in header
%include "swig-example.h"

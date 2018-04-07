%module swig_example

// Bindings for python to understand object signature and treat as non-generic *
%include "std_vector.i"

// Defines the wrapper python uses to convert template type to python object
namespace std
{
  %template(IntVector) vector<int>;
}

// Add necessary symbols to generated header
%{
#include "swig-example.h"
%}

// Process symbols in header
%include "swig-example.h"

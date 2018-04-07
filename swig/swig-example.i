// This module is exported into a swig_example.py file to be loaded, but compiled against _swig_example.lib
// see http://www.swig.org/papers/PyTutorial98/PyTutorial98.pdf
%module swig_example

// Bindings for python to understand object signature and treat as non-generic *
%include "std_vector.i"

// Defines the wrapper python uses to convert template type to python object
namespace std
{
  %template(IntVector) vector<int>;
  %template(DoubleVector) vector<double>;
  %template(IntVector) vector<int>;
  %template(IntVector) vector<int>;
}

// Add necessary symbols to generated header
%{
#include "swig-example.h"
%}

// Enforce access by value: %naturalvar Test::method
// Process symbols in header
%include "swig-example.h"

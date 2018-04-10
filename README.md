# SWIG Example

This is an example of how to use CMake with the [SWIG](http://www.swig.org) interface generator. It is meant for those
interested to use as a guide to setting up a project built by CMake with interfaces in other languages generated by
SWIG.

---

### Installation
A large part of this example is how to install both the C/C++ libraries that SWIG is wrapping as well as the generated
wrappers. 

### Requirements

* [Python 2.8.1 or later](https://www.python.org/downloads/)
* [CMake 3.5 or later](https://cmake.org/download/)
* [Swig 3.0.12 or later](http://www.swig.org/download.html)

### How-To Create bindings for default project
* Install Python - Enable 'Add To System Path' in the installer for cmake find_package
* Download Swig 3.0.12 (Pre-compiled for windows) and add swig.exe to system path 
* Run 'python' and 'swig' on command line console to verify above is successful
* Configure CMake targetting root folder containing swig-example and liba folders
* Enable -DBUILD_BINDINGS cmake flag
* Configure 
* Build 

### How-To Add a New Language
* Duplicate the python folder at the same directory level
* Rename to target language i.e. 'perl'
* Add an option and condition to add_directory in current level CMakeLists.txt (see BUILD_PYTHON in this file)
* Change the CMakeLists.txt in the duplicated folder find_package, swig_add_modules and ${PYTHON_LIBRARIES} macros to target language 

```
i.e. find_package(PerlLibs), swig_add_modules(... perl *.i), swig_link_libraries(${PERL_LIBRARIES})
```

---

### Supported Languages
This example currently generates interfaces for the following languages:

* Python
* Perl

Swig supports:

* C# (via PInvoke)
* Javascript
* Tcl
* Java
* Javascript

See How-to Add a New Language section on adding new languages.

---

### Use with another project
* Copy the swig-example level CMake script and bindings into your target project source directory.
* Edit the CMakeLists.txt script, line 5, and change the project name
* Remove the external link to liba.lib, line 21
* Add the include directory to external header files, line 14
* Change the filename of the .i interface file to <project name>.i.
* Change the C++ header files in swig-example.i to your target headers 
* Run cmake with the BUILD_BINDINGS flag enabled
* Build the generated IDE solution

---

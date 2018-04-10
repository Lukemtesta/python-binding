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

### How-To Create Bindings
* Install Python - Enable 'Add To System Path' in the installer for cmake find_package
* Download Swig 3.0.12 (Pre-compiled for windows) and add swig.exe to system path 
* Run 'python' and 'swig' on command line console to verify above is successful
* Configure CMake targetting the root folder of swig-example and liba
* Enable -DBUILD_BINDINGS cmake flag
* Configure 
* Generate projects
* Build in Release
* Import the auto-generated python module swig-example.py into a python console or script. Ensure you have the generated .lib and .pyd files in the working directory (and .dll if you are linking against shared libraries).

### How-To Add a New Language
* Duplicate a language binding function and rename accordingly i.e. PythonFunctions.cmake -> PerlFunctions.cmake
* Add an option and condition to call add_bindings_<language> in bindings/swig level CMakeLists.txt (see BUILD_PYTHON in this file)
* Change the new functions find_package, swig_add_modules and ${PYTHON_LIBRARIES} macros to target language 

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

### How-To Build Bindings for a Different Project
* Copy the swig-example level bindings directory into your target project directory.
* In your project CMakeLists.txt script, include all .cmake files in the bindings/swig/functions directory using CMake include (see bindings/swig/CMakeLists.txt lines 6-11)
* Change the name of the /binding/swig/*.i file to the project name
* Call the add_bindings_<language> CMake function with the parameters: ${PROJECT_NAME}, ${PROJECT_NAME}.i and external header include directory (Empty if none)
* Configure and Build the generated IDE solution

---

#include <iostream>

#include "liba.h"

#include "swig-example.h"

void swig_example_hello()
{
    std::cout << "Hello from swig-example" << std::endl;
}

void link_liba_hello()
{
    liba_hello();
}

void blah()
{
	std::cout << "blah" << std::endl;
}

void vector_print()
{
	std::cout << "vector print" << std::endl;
}

std::vector<int> random_vector_int()
{
	return std::vector<int>{ 1, 2, 3, 4, 5 };
}
#include "Utils.h"
#include <iostream>
#include <windows.h>

void UTI_Log(const std::string& _toto)
{
std::cout << _toto;
OutputDebugString(_toto.c_str());
}
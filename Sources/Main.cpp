#include "Platform.h"



int main(int argc, char *argv[])
	{
  Event e;

	PlatformInit();
	PlatformCreateWindow(640,480, "toto");
  while (e.type != EVT_QUIT)
    {
    PlatformPollEvent(&e);
    PlatformDelay(500);
    }
	PlatformQuit();
	}
#ifndef __PLATFORM_H__
#define __PLATFORM_H__

#include <string>

struct Event
{
    int type;
    Event():type(0) {}
};

int PlatformInit();
int PlatformCreateWindow(int sizeX,int sizeY, std::string title);
int PlatformQuit();
void PlatformDelay(int ms);
int PlatformPollEvent(Event * event);


const int EVT_QUIT = -1;

#endif
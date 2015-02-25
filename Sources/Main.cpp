#include <EGL/egl.h>
#include <GLES2/gl2.h>

#include "pugixml.hpp"
#include "nativewin.h"
#include <stdio.h>

void OnNativeWinResize(int width, int height)
{
}

void OnNativeWinMouseMove(int mousex, int mousey, bool lbutton)
{
}

int main()
{
  EGLBoolean bsuccess;

    // create native window
    EGLNativeDisplayType nativeDisplay;
    if(!OpenNativeDisplay(&nativeDisplay))
    {
        printf("Could not get open native display\n");
        return GL_FALSE;
    }

}

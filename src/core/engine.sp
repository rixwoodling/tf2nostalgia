#if defined _TF2N_ENGINE_
    #endinput
#endif
#define _TF2N_ENGINE_

#include "hooks.sp"

void Engine_Init()
{
    Hooks_Init();
    PrintToServer("[TF2N] Engine initialized.");
}

#if defined _TF2N_ENGINE_
    #endinput
#endif
#define _TF2N_ENGINE_

#include "era.sp"
#include "normalize.sp"

void Engine_Init()
{
    Era_Init();
    Normalize_Init();
    PrintToServer("[TF2N] Engine initialized.");
}

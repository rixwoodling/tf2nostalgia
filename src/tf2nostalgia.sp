/**
 * ============================================================================
 * TF2 Nostalgia Engine
 * Entry point for the TF2 Nostalgia engine.
 * Author: Rix
 * ============================================================================
 */

#include <sourcemod>
#include "core/engine.sp"

public Plugin myinfo =
{
    name = "TF2 Nostalgia Engine",
    author = "Rix",
    description = "Historical rules engine for Team Fortress 2",
    version = "dev",
    url = ""
};

public void OnPluginStart()
{
    PrintBanner();
    Engine_Init();
}

void PrintBanner()
{
    PrintToServer("");
    PrintToServer("========================================");
    PrintToServer("      TF2 Nostalgia Engine");
    PrintToServer("========================================");
    PrintToServer("");
}

#if defined _TF2N_HOOKS_
    #endinput
#endif
#define _TF2N_HOOKS_

#include <sdkhooks>
#include <tf2>

void Hooks_Init()
{
    PrintToServer("[TF2N] Registering hooks...");

    HookEvent("player_spawn", Event_PlayerSpawn);
}

public void Event_PlayerSpawn(Event event, const char[] name, bool dontBroadcast)
{
    int client = GetClientOfUserId(event.GetInt("userid"));

    if (!IsValidClient(client))
        return;

    TFClassType class = TF2_GetPlayerClass(client);
    PrintToServer(
        "[TF2N] %N spawned as %d.",
        client,
        class
    );
}

bool IsValidClient(int client)
{
    return (
        client > 0 &&
        client <= MaxClients &&
        IsClientInGame(client)
    );
}

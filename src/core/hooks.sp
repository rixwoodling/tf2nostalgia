#if defined _TF2N_HOOKS_
    #endinput
#endif
#define _TF2N_HOOKS_

#include <sdkhooks>
#include <tf2_stocks>

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

    char className[16];
    GetClassName(class, className, sizeof(className));

    PrintToServer(
        "[TF2N] %N spawned as %s.",
        client,
        className
    );

    InspectWeapons(client);
}

bool IsValidClient(int client)
{
    return (
        client > 0 &&
        client <= MaxClients &&
        IsClientInGame(client)
    );
}

void GetClassName(TFClassType class, char[] buffer, int maxlen)
{
    switch (class)
    {
        case TFClass_Scout:
            strcopy(buffer, maxlen, "Scout");

        case TFClass_Sniper:
            strcopy(buffer, maxlen, "Sniper");

        case TFClass_Soldier:
            strcopy(buffer, maxlen, "Soldier");

        case TFClass_DemoMan:
            strcopy(buffer, maxlen, "Demoman");

        case TFClass_Medic:
            strcopy(buffer, maxlen, "Medic");

        case TFClass_Heavy:
            strcopy(buffer, maxlen, "Heavy");

        case TFClass_Pyro:
            strcopy(buffer, maxlen, "Pyro");

        case TFClass_Spy:
            strcopy(buffer, maxlen, "Spy");

        case TFClass_Engineer:
            strcopy(buffer, maxlen, "Engineer");

        default:
            strcopy(buffer, maxlen, "Unknown");
    }
}

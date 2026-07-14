#if defined _TF2N_WEAPONS_
    #endinput
#endif
#define _TF2N_WEAPONS_

#include <sdktools>

void InspectWeapons(int client)
{
    int weapon = GetPlayerWeaponSlot(client, 0);

    if (weapon == -1)
    {
        PrintToServer("[TF2N] No primary weapon.");
        return;
    }

    int itemDef = GetEntProp(
        weapon,
        Prop_Send,
        "m_iItemDefinitionIndex"
    );

    bool allowed = IsWeaponAllowed(itemDef);

    PrintToServer(
        "[TF2N] Primary ItemDef: %d  Allowed: %s",
        itemDef,
        allowed ? "Yes" : "No"
    );

    if (!allowed)
    {
        NormalizePrimaryWeapon(client, itemDef);
    }
}

bool IsWeaponAllowed(int itemDef)
{
    switch (itemDef)
    {
        case 18, 205:
        {
            return true;
        }

        default:
        {
            return false;
        }
    }
}

int GetStockReplacement(int itemDef)
{
    switch (itemDef)
    {
        case 205: // Rocket Jumper
        {
            return 18; // Rocket Launcher
        }

        case 208: // Backburner
        {
            return 21; // Flamethrower
        }
    }

    return -1;
}

void NormalizePrimaryWeapon(int client, int itemDef)
{
    int replacement = GetStockReplacement(itemDef);

    PrintToServer(
        "[TF2N] Would normalize %N's primary weapon (ItemDef: %d -> %d).",
        client,
        itemDef,
        replacement
    );
}

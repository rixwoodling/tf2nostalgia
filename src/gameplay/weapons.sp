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

    PrintToServer(
        "[TF2N] Primary entity: %d  ItemDef: %d",
        weapon,
        itemDef
    );
}

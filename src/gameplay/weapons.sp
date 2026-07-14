#include <sdktools>

void InspectWeapons(int client)
{
    int weapon = GetPlayerWeaponSlot(client, 0);

    PrintToServer(
        "[TF2N] Primary weapon entity: %d",
        weapon
    );
}

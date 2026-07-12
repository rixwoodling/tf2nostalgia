/**
 * ============================================================================
 *
 * TF2 Nostalgia Engine
 *
 * A historical rules engine for Team Fortress 2.
 *
 * The engine itself contains no historical logic.
 * Every era is described entirely by configuration.
 *
 * The engine is responsible for:
 *   - Loading the active era
 *   - Enforcing weapons
 *   - Enforcing cosmetics
 *   - Enforcing maps
 *   - Updating the hostname
 *   - Displaying the MOTD
 *
 * Historical data is defined exclusively by JSON configuration files.
 *
 * Author: Rix
 * Version: 0.1.0
 *
 * ============================================================================
 */

#include <sourcemod>

#define PLUGIN_NAME    "TF2 Nostalgia Engine"
#define PLUGIN_VERSION "0.1.0"

public Plugin myinfo =
{
    name = PLUGIN_NAME,
    author = "Rix",
    description = "Historical rules engine for Team Fortress 2",
    version = PLUGIN_VERSION,
    url = ""
};

public void OnPluginStart()
{
    PrintToServer(" ");
    PrintToServer("========================================");
    PrintToServer("      TF2 Nostalgia Engine");
    PrintToServer("          Version %s", PLUGIN_VERSION);
    PrintToServer("========================================");
    PrintToServer(" ");

    RegAdminCmd(
        "sm_nostalgia_status",
        Command_Status,
        ADMFLAG_ROOT,
        "Display TF2 Nostalgia Engine status"
    );

    RegAdminCmd(
        "sm_nostalgia_version",
        Command_Version,
        ADMFLAG_ROOT,
        "Display engine version"
    );

    PrintToServer("[TF2N] Engine initialized.");
}

public Action Command_Status(int client, int args)
{
    ReplyToCommand(client, " ");
    ReplyToCommand(client, "========== TF2 Nostalgia ==========");
    ReplyToCommand(client, "Engine : %s", PLUGIN_VERSION);
    ReplyToCommand(client, "Status : Running");
    ReplyToCommand(client, "Era    : Not Loaded");
    ReplyToCommand(client, "Config : Not Loaded");
    ReplyToCommand(client, "===================================");
    ReplyToCommand(client, " ");

    return Plugin_Handled;
}

public Action Command_Version(int client, int args)
{
    ReplyToCommand(client,
        "TF2 Nostalgia Engine v%s",
        PLUGIN_VERSION);

    return Plugin_Handled;
}

#if defined _TF2N_COMMANDS_
    #endinput
#endif
#define _TF2N_COMMANDS_

void Commands_Init()
{
    RegAdminCmd("sm_tf2n_test", Command_Test, ADMFLAG_ROOT);
}

public Action Command_Test(int client, int args)
{
    PrintToServer("[TF2N] Test command works.");

    return Plugin_Handled;
}

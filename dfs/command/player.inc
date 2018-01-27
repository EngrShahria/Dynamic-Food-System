CMD:editfood(playerid, params[])
{

	new owner[MAX_PLAYER_NAME+1],
		Float:X,
		Float:Y,
		Float:Z;

	GetPlayerName(playerid, owner, sizeof(owner));

	for( new i; i < MAX_FOODSTALL; i++)
	{
		GetDynamicObjectPos(FoodStallInfo[i][fsSID], X, Y, Z);
		GetPlayerName(playerid, owner, sizeof(owner);
		
		if( IsPlayerInRangeOfPoint(playerid, 10, X, Y, Z))
		{
			if(!strcmp(FoodStallInfo[i][fsOwner], owner, true))

			{
				SendClientMessage(playerid, -1, "Working");
			}
			
		}
	}
	return 1;
}


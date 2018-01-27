CMD:foodstall_add( playerid, params[] )
{
	new type,
		tempID,
		bool: found;
	if(sscanf(params, "d", type))
	{
		SendClientMessage(playerid, -1, "/foodstall_add [type]");
		SendClientMessage(playerid, -1, "Types: 1: Noodles Stall 2: HotDog Stall 3: Ice Cream Stall 4: Misc");
		return 1;
	}
	//Loop to find the free ID.
	for(new fID = 1; fID <= MAX_FOODSTALL; fID++)
	{
		if(FoodStallInfo[fID][fsCreated] == 0)
		{
			tempID = fID;
			found = true;
			break;
		}
	}

	if(found)
		{
			new Float:x, Float:y, Float:z, vw, int;
			GetPlayerPos(playerid, x, y, z);
			vw = GetPlayerVirtualWorld(playerid);
			int = GetPlayerInterior(playerid);
			FoodStallInfo[tempID][fsCreated] = 1;
			FoodStallInfo[tempID][fsType] = type;
			FoodStallInfo[tempID][fsPosX] = x;
			FoodStallInfo[tempID][fsPosY] = y;
			FoodStallInfo[tempID][fsPosZ] = z;
			FoodStallInfo[tempID][fsPosRx] = 0;
			FoodStallInfo[tempID][fsPosRy] = 0;
			FoodStallInfo[tempID][fsPosRz] = 0;
			FoodStallInfo[tempID][fsWorld] = vw;
			FoodStallInfo[tempID][fsInt] = int;

			if( type == 1 )
				{
					FoodStallInfo[tempID][fsSID] = CreateDynamicObject(FoodStallType_1, FoodStallInfo[tempID][fsPosX], FoodStallInfo[tempID][fsPosY], FoodStallInfo[tempID][fsPosZ], FoodStallInfo[tempID][fsPosRx], FoodStallInfo[tempID][fsPosRy], FoodStallInfo[tempID][fsPosRz], FoodStallInfo[tempID][fsWorld], FoodStallInfo[tempID][fsInt]);
				}
			else if( type == 2 )
				{
					FoodStallInfo[tempID][fsSID] = CreateDynamicObject(FoodStallType_2, FoodStallInfo[tempID][fsPosX], FoodStallInfo[tempID][fsPosY], FoodStallInfo[tempID][fsPosZ], FoodStallInfo[tempID][fsPosRx], FoodStallInfo[tempID][fsPosRy], FoodStallInfo[tempID][fsPosRz], FoodStallInfo[tempID][fsWorld], FoodStallInfo[tempID][fsInt]);
				} 
			else if( type == 3 )
				{
					FoodStallInfo[tempID][fsSID] = CreateDynamicObject(FoodStallType_3, FoodStallInfo[tempID][fsPosX], FoodStallInfo[tempID][fsPosY], FoodStallInfo[tempID][fsPosZ], FoodStallInfo[tempID][fsPosRx], FoodStallInfo[tempID][fsPosRy], FoodStallInfo[tempID][fsPosRz], FoodStallInfo[tempID][fsWorld], FoodStallInfo[tempID][fsInt]);
				}
			else if( type == 4 )
				{
					FoodStallInfo[tempID][fsSID] = CreateDynamicObject(FoodStallType_4, FoodStallInfo[tempID][fsPosX], FoodStallInfo[tempID][fsPosY], FoodStallInfo[tempID][fsPosZ], FoodStallInfo[tempID][fsPosRx], FoodStallInfo[tempID][fsPosRy], FoodStallInfo[tempID][fsPosRz], FoodStallInfo[tempID][fsWorld], FoodStallInfo[tempID][fsInt]);
				}

		}
	else
		{
			SendClientMessage(playerid, -1, "ERROR: No free ID found.");
		}

	return 1;
}



CMD:fsmakeowner(playerid, params[])
{
	
	return 1;
}



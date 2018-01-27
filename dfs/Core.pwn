/*
		Dynamic Food stall SYSTEM'S ENUM
		Data Structures, Variables & Definitions
*/
//includes
#include <YSI\y_hooks>



//Defines.
#define MAX_FOODSTALL 10 //Max food stall can be created.
#define Foodstall_data_location "Foodstall.data" //File will be saved as Foodstall.data

#define FoodStallDialog_ 1 //Dialogs for the

/*
1342-noodlecart_prop
1340-chillidogcart/
1341-icescart_prop/
3039-ct_stall1
*/
#define FoodStallType_1 1342 // Noodles Stall
#define FoodStallType_2 1340 // HotDog Stall
#define FoodStallType_3 1341 // Ice Cream Stall
#define FoodStallType_4 3039 // Misc




enum E_FoodStallInfo//Food Stall info
{
	fsCreated,
	fsSID,
	fsOwner[MAX_PLAYER_NAME],
	fsType,
	Float:fsPosX,
	Float:fsPosY,
	Float:fsPosZ,
	Float:fsPosRx,
	Float:fsPosRy,
	Float:fsPosRz,
	fsWorld,
	fsInt,
	//Stall name slot
	fsName[MAX_PLAYER_NAME],
	//Food Items
	fsFSlot1[MAX_PLAYER_NAME],
	fsFPrice1,
	fsFSlot2[MAX_PLAYER_NAME],
	fsFPrice2

}
new FoodStallInfo[MAX_FOODSTALL][E_FoodStallInfo];

/*
		SAVING SYSTEM
*/
SaveFoodStall()
{
	new FileString[128];
	new File: fsFile,
			fsID;
	while( fsID < sizeof(FoodStallInfo)) {

		format(FileString, sizeof(FileString), "%d|%d|%s|%d|%f|%f|%f|%f|%f|%f|%d|%d|%s|%s|%d|%s|%d|\r\n", //17
			FoodStallInfo[fsID][fsCreated],
			FoodStallInfo[fsID][fsSID],
			FoodStallInfo[fsID][fsOwner],
			FoodStallInfo[fsID][fsType],
			FoodStallInfo[fsID][fsPosX],
			FoodStallInfo[fsID][fsPosY],
			FoodStallInfo[fsID][fsPosZ],
			FoodStallInfo[fsID][fsPosRx],
			FoodStallInfo[fsID][fsPosRy],
			FoodStallInfo[fsID][fsPosRz],
			FoodStallInfo[fsID][fsWorld],
			FoodStallInfo[fsID][fsInt],
			FoodStallInfo[fsID][fsName],
			FoodStallInfo[fsID][fsFSlot1],
			FoodStallInfo[fsID][fsFPrice1],
			FoodStallInfo[fsID][fsFSlot2],
			FoodStallInfo[fsID][fsFPrice2]
		);
		if(fsID == 0)
		{
			fsFile = fopen(Foodstall_data_location, io_write);
		}
		else
		{
			fsFile = fopen(Foodstall_data_location, io_append);
		}
		fwrite(fsFile, FileString);
		fsID++;
		fclose(fsFile);
		print("Saved the food stalls");
	}

	return 1;
}

LoadFoodStall() {

	if(!fexist(Foodstall_data_location)) return fcreate(Foodstall_data_location);

	new
		FileString[128],
		fsID,
		File: iFileHandle = fopen(Foodstall_data_location, io_read);

	while (fsID < sizeof(FoodStallInfo) && fread(iFileHandle, FileString)) {

		sscanf(FileString, "p<|>iis[24]iffffffiis[24]s[24]is[24]i",
			FoodStallInfo[fsID][fsCreated],
			FoodStallInfo[fsID][fsSID],
			FoodStallInfo[fsID][fsOwner],
			FoodStallInfo[fsID][fsType],
			FoodStallInfo[fsID][fsPosX],
			FoodStallInfo[fsID][fsPosY],
			FoodStallInfo[fsID][fsPosZ],
			FoodStallInfo[fsID][fsPosRx],
			FoodStallInfo[fsID][fsPosRy],
			FoodStallInfo[fsID][fsPosRz],
			FoodStallInfo[fsID][fsWorld],
			FoodStallInfo[fsID][fsInt],
			FoodStallInfo[fsID][fsName],
			FoodStallInfo[fsID][fsFSlot1],
			FoodStallInfo[fsID][fsFPrice1],
			FoodStallInfo[fsID][fsFSlot2],
			FoodStallInfo[fsID][fsFPrice2]
		);
		if(FoodStallInfo[fsID][fsCreated] != 0)
		{
			if(FoodStallInfo[fsID][fsType] == 1 )
				{
					FoodStallInfo[fsID][fsSID] = CreateDynamicObject(FoodStallType_1, FoodStallInfo[fsID][fsPosX], FoodStallInfo[fsID][fsPosY], FoodStallInfo[fsID][fsPosZ], FoodStallInfo[fsID][fsPosRx], FoodStallInfo[fsID][fsPosRy], FoodStallInfo[fsID][fsPosRz], FoodStallInfo[fsID][fsWorld], FoodStallInfo[fsID][fsInt]);

				}
			else if( FoodStallInfo[fsID][fsType] == 2 )
				{
					FoodStallInfo[fsID][fsSID] = CreateDynamicObject(FoodStallType_2, FoodStallInfo[fsID][fsPosX], FoodStallInfo[fsID][fsPosY], FoodStallInfo[fsID][fsPosZ], FoodStallInfo[fsID][fsPosRx], FoodStallInfo[fsID][fsPosRy], FoodStallInfo[fsID][fsPosRz], FoodStallInfo[fsID][fsWorld], FoodStallInfo[fsID][fsInt]);

				}
			else if( FoodStallInfo[fsID][fsType] == 3 )
				{
					FoodStallInfo[fsID][fsSID] = CreateDynamicObject(FoodStallType_3, FoodStallInfo[fsID][fsPosX], FoodStallInfo[fsID][fsPosY], FoodStallInfo[fsID][fsPosZ], FoodStallInfo[fsID][fsPosRx], FoodStallInfo[fsID][fsPosRy], FoodStallInfo[fsID][fsPosRz], FoodStallInfo[fsID][fsWorld], FoodStallInfo[fsID][fsInt]);

				}
			else if( FoodStallInfo[fsID][fsType] == 4 )
				{
					FoodStallInfo[fsID][fsSID] = CreateDynamicObject(FoodStallType_4, FoodStallInfo[fsID][fsPosX], FoodStallInfo[fsID][fsPosY], FoodStallInfo[fsID][fsPosZ], FoodStallInfo[fsID][fsPosRx], FoodStallInfo[fsID][fsPosRy], FoodStallInfo[fsID][fsPosRz], FoodStallInfo[fsID][fsWorld], FoodStallInfo[fsID][fsInt]);

				}
		}
		++fsID;
		}

	fclose(iFileHandle);
	printf("Loaded the Food Stalls.");
	return 1;
}


stock fcreate(filename[])
{
	if (fexist(filename)) return false;
	new File:fmake;
	fmake = fopen(filename, io_write);
	if (fmake) {
		fclose(fmake);
		return true;
	}
	return false;
}

/*
==========================================================================================
=======================================TIMERS=============================================
==========================================================================================
*/

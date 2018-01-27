

/*
		CORE INCLUDES
*/

#include <a_samp>
#include <sscanf2>
#include <streamer>
#include <dini>
#include <ZCMD>


//	Contains core components that child includes rely on, i.e: data structure, saving, loading, states, setting etc
#include "./dfs/Core.pwn"
/*
		CHILD INCLUDES
*/

//	Commands to edit/add/remove -admin
#include "./dfs/command/modify.inc"

//	Player related commands
#include "./dfs/command/player.inc"

//	Dialogs belonging to the rental system

#include "./dfs/command/dialogs.inc"

public OnFilterScriptInit()
{
  LoadFoodStall();
  return 1;
}
public OnFilterScriptExit()
{
  SaveFoodStall();
  return 1;
}

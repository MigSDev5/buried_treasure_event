Dynamic event for dayz epoch developer by Mig.</br>

<b>** INSTALLATION **</br>
  - Download the archive.</br>
  
  - Place the file mig_buried_treasure_server.sqf in your modules folder (dayz_server\modules).</br>
  
  - Place the event folder in your Scripts folder (MpMissions client side).</br>
  
  - Open your init.sqf in the section 
  
         if (!isDedicated) then {
  
      add this line:
      
        [] execVM "scripts\event\mig_buried_treasure_init.sqf";
        
      in array: 
	
	      EpochEvents 
	      
       add this: 
       
          ["any","any","any","any",50,"mig_buried_treasure_event"]
        
  - Open your custom fn_selfaction.sqf after this:</br>
  
        } else {
	           _vehicle removeAction s_player_fishing_veh;
	           s_player_fishing_veh = -1;
        };
	
      add this bloc:
	
            if ((speed player <= 1) && cursorTarget isKindOf "Grave" && (player distance cursorTarget < 5) && cursorTarget getVariable ["Grave",0] == 1) then {
                 if (s_player_dig_treasure < 0) then {
                       s_player_dig_treasure = player addAction ["Dig Up Treasure","scripts\event\mig_buried_treasure.sqf",cursorTarget, 0, false, true,"",""];
                  };
            }else{
               player removeAction s_player_dig_treasure;
               s_player_dig_treasure = -1;
             };
	     
       and after this:</br>
       
       	   player removeAction s_player_manageDoor;
	    s_player_manageDoor = -1;
	  
       add this bloc: </br>
       
          player removeAction s_player_dig_treasure;
          s_player_dig_treasure = -1;
	  
   - Open your custom variable.sqf in the end of this section: </br>
    
          dayz_resetSelfActions = {
	
      add this:
      
          s_player_dig_treasure = -1;
       
   done
   
  You can configure various options.
   

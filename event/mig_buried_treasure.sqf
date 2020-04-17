private ["_graves","_position","_direction","_loopTime","_animState","_started","_finished","_Loop","_isMedic","_check","_box","_TreasureLoot1","_random","_bomb","_agent","_id","_holder","_items"];

if(isNil "TreasureActionInProgress")then{
        TreasureActionInProgress = false;
};

if (TreasureActionInProgress) exitWith {SystemChat "You are already digging.Wait for the end !!";};

_graves = _this select 3;
_position = getPosATL _graves;
_direction = getDir _graves;
_loopTime = time;

TreasureActionInProgress = true;

cutText ["Starting to Dig..", "PLAIN DOWN"];

player playActionNow "Medic";
[player,"repair",0,false,20] call dayz_zombieSpeak;

_animState = animationState player;
_Loop = true;
_started = false;
_finished = false;
while {_Loop} do {
	_animState = animationState player;
	_isMedic = ["medic",_animState] call fnc_inString;			
	if (_isMedic) then {
		_started = true;
	};
	if(!_isMedic && (time - _loopTime) < 15) then {
		player playActionNow "Medic";
		_isMedic = true;
	};
	if (_started && !_isMedic && (time - _loopTime) > 15) then {
		_Loop = false;
		_finished = true;
	};
	sleep 0.1;
};
_Loop = false;

if (_finished) then {
    {deleteVehicle _x} forEach nearestObjects [(getPos _graves), ["Grave","GraveCross1","GraveCross2","GraveCrossHelmet","ClutterCutter_small_2_EP1"],2];

    _check = _graves getVariable ["LeLoot",0];
    if (_check == 2) then {
	    _box = createVehicle ["USOrdnanceBox",_position,[],0,"CAN COLLIDE"];
		_box setVariable ["permaLoot",true];
		clearWeaponCargoGlobal _box;
	    clearMagazineCargoGlobal _box;
	    clearBackpackCargoGlobal _box;
	    _box setDir _direction;
	    _box setposATL _position;
		CrateSpawned = true;
		publicVariableServer "CrateSpawned";
		_TreasureLoot1 = TreasureLootList call BIS_fnc_selectRandom;
		{
            _box addWeaponCargoGlobal [_x,1];
        } forEach (_TreasureLoot1 select 0);
        {
            _box addMagazineCargoGlobal [_x,1];
        } forEach (_TreasureLoot1 select 1);
		cutText ["Yeah ... you found the treasure !!..", "PLAIN DOWN"];
    }else{
        _random = floor(random(8));
        switch (_random) do { 
            case 0 : 
	        {
                player setHit ["legs",1];
				r_fracture_legs = true;
		        cutText ["The treasure is trapped !,vous \n You have broken leg..", "PLAIN DOWN"];
	        }; 
            case 1 : 
	        {
                r_player_blood = 5000;
	            r_player_injured = true;
		        cutText ["The treasure is trapped !.\n You lost 5000 of blood.", "PLAIN DOWN"];
	        }; 
	        case 2 : 
	        {
		        cutText ["The treasure is trapped !.\n You are unconscious.", "PLAIN DOWN"];
		        r_player_unconscious = true;
	            r_player_injured = true;
	        };
	        case 3 : 
	        {
		        cutText ["The treasure is trapped !.\n You have broken arms !", "PLAIN DOWN"];
				player setHit["hands",1];
				r_fracture_arms = true;
            };
            case 4 : 
	        {
		        cutText ["The treasure is trapped !.\n You are infected !", "PLAIN DOWN"];
				r_player_infected = true;
            };
            case 5 : 
	        {
		        cutText ["The treasure is trapped !.\n There is a bomb,it's going to explode!.", "PLAIN DOWN"];
				_itemBomb = createVehicle ["BAF_ied_v1",_position, [], 0, "CAN_COLLIDE"];
				sleep 15;
				_bomb = ["HelicopterExploSmall","HelicopterExploBig","Bo_GBU12_LGB"] call BIS_fnc_selectRandom;
				_bomb = createVehicle [_bomb,_position, [], 0, "CAN_COLLIDE"];
				sleep 5;
				deleteVehicle _itemBomb;
	        };
            case 6 : 
	        {
                cutText ["The treasure is trapped !.\n A goat is hidden in it !", "PLAIN DOWN"];
				sleep 2;
				_agent = createAgent ["Goat",_position, [],0,"CAN_COLLIDE"];
				_id = [_position,_agent] execFSM "\z\addons\dayz_code\system\animal_agent.fsm";
            };           
			case 7 : 
	        {
                cutText ["There is only garbage in this grave!", "PLAIN DOWN"];
				sleep 2;
				_holder = createVehicle ["WeaponHolder", _position, [], 0, "CAN_COLLIDE"];
				_items = ["FoodChipsSulahoopsEmpty","FoodChipsMysticalesEmpty","FoodChipsChocolateEmpty"] call BIS_fnc_selectRandom;
				_holder addMagazineCargoGlobal [_items,(round (random 3))];
            };
        };
    };
};
TreasureActionInProgress = false;

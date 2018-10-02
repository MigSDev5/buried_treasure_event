 
private ["_spawnChance","_NumberMound","_GravesWaitTime","_TresureMarkerRad","_TreasureColorMarker","_TreasureColorDotMarker","_NameOfEventTreasure","_startTime","_position","_variable","_lootPos","_graves","_clutter","_crosstype","_cross","_eventMarker","_dot","_playerPresent","_currentTime","_timeLeft"];
 
//---------------- config ------------------
//_spawnChance   = 0.4;
_NumberMound            = 8;     // number of graves
_GravesWaitTime         = 1200;
_TresureMarkerRad       = 350;  // radius of the marker
_TreasureColorMarker    = "ColorBlue";
_TreasureColorDotMarker = "ColorGreen";
_NameOfEventTreasure    = "Mig's Buried Treasure";
CrateSpawned            = false;
//--------------- end config ------------------
 
//_spawnRoll = random 1;
//if (_spawnRoll > _spawnChance) exitWith {};

_startTime = floor(time);

_position = [getMarkerPos "center",0,5000,(round random 30),0,0.25,0] call BIS_fnc_findSafePos;
 
_variable = 0;
 for "_z" from 1 to _NumberMound do {
    _variable = _variable + 1;
    _lootPos = [_position,0,150,10,0,0.25,0] call BIS_fnc_findSafePos;
    _graves = createVehicle ["Grave", _lootPos, [], 70, "NONE"];
    _clutter = createVehicle ["ClutterCutter_small_2_EP1",getPosATL _graves, [], 0, "CAN_COLLIDE"];
	_graves setVariable ["LeLoot",_variable,true];
    _crosstype = ["GraveCross1","GraveCross2","GraveCrossHelmet"]  call BIS_fnc_selectRandom;
    _cross = createVehicle [_crosstype, getPos _graves, [], 0, "CAN_COLLIDE"];
    _cross setpos [(getposATL _cross select 0),(getposATL _cross select 1)-1.2, 0];
	_graves setVariable ["Grave",1,true];
};

_eventMarker = createMarker [format["loot_eventMarker_%1", _startTime], _position];
_eventMarker setMarkerShape "ELLIPSE";
_eventMarker setMarkerColor _TreasureColorMarker;
_eventMarker setMarkerAlpha 0.5;
_eventMarker setMarkerSize [_TresureMarkerRad,_TresureMarkerRad];
_dot = createMarker [format["dot_%1", _starttime], _position];
_dot setMarkerText _NameOfEventTreasure;
_dot setMarkerShape "ICON";
_dot setMarkerType "dot";
_dot setMarkerColor _TreasureColorDotMarker;
_dot setMarkerAlpha 1;
_dot setMarkerSize [1,1];

treasureMessage = ["hintTreasure"];
publicVariable "treasureMessage";

_playerPresent = false;
_currentTime = floor(time);

while {_GravesWaitTime > (_currentTime - _startTime) && !CrateSpawned} do {
    uisleep 2;
    _currentTime = floor(time);
    {if((isPlayer _x) && (_x distance _cross <= 80)) then {_playerPresent = true;};}forEach playableUnits;
};

sleep 5;

deleteMarker _eventMarker;
deleteMarker _dot;
deleteVehicle _clutter;

CrateSpawned = nil;

_timeLeft = _GravesWaitTime - (_currentTime-_startTime);
if (_timeLeft > 0) then {
    uisleep _timeLeft;
};
 
 {deleteVehicle _x} forEach nearestObjects [_position, ["Grave","GraveCross1","GraveCross2","GraveCrossHelmet","ClutterCutter_small_2_EP1"],350];
 

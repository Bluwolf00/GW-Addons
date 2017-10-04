/*
	Author: GuzzenVonLidl
	Opens random doors in a area

	Usage:
	[this, 50, 0.1] call GW_Common_Fnc_ambientDoors;

	Arguments:
	0: Location <OBJECT,ARRAY>
	1: Radius <NUMBER>
	2: Chance of Door opening <NUMBER> (0-1, 1 = open all doors )
	3: Open Instantly <BOOL>

	Return Value: NO

	Public: NO
*/
#include "script_Component.hpp"

params ["_location",["_radius", 50], ["_thresHold", 0.6], ["_isInstant", (time < 1)]];

private _MaxDoorsInHouse = 22;  		//<----------------------- Maximal number of doors in da house - current 22 doors - CAN CHANGE!!!!
private _MaxHatchesInHouse = 6;  		//<----------------------- Maximal number of hatches in da house - current 6 hatches - CAN CHANGE!!!!
private _classes = ["House","ThingX","Wall_F"];
private _objects = [];

{
	_objects = (_objects + ((_location call CBA_fnc_getPos) nearObjects [_x,_radius]));
} forEach _classes;

{
	_x params ["_door"];
	for "_i" from 1 to _MaxDoorsInHouse do {
//		_doOpen = (selectRandom [0,0,1]);
		_doOpen = [0,1] select ((random 1) <= _thresHold);
		_door animate [format ["Door_%1_rot", _i],_doOpen,_isInstant];
	};
	for "_i" from 1 to _MaxHatchesInHouse do {
//		_doOpen = (selectRandom [0,1,1]);
		_doOpen = [0,1] select ((random 1) >= _thresHold);
		_door animate [format ["Hatch_%1_rot", _i],_doOpen,_isInstant];
	};
} foreach _objects;
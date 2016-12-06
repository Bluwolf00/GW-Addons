#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"
#include "functions.sqf"	// Old functions that needs to be updated

[{

//	[DIK code, [Shift, Ctrl, Alt]]
	["GW","flexi_InteractSelfClient", "Client Menu", {[1] call FUNC(flexi_selectMenu);}, {}, [DIK_RWIN,[false,false,false]]] call CBA_fnc_addKeybind;
	["GW","flexi_InteractSelfAdmin", "Admin Menu", {[2] call FUNC(flexi_selectMenu);}, {}, [DIK_INSERT,[true,false,true]]] call CBA_fnc_addKeybind;

	if (isClass (configFile >> "CfgPatches" >> "STUI_Core")) then {
		GVAR(STHud_Compass_Stored) = STHud_Compass;
	};

	[{
		if (isNil {profileNamespace getVariable QGVAR(clientSettingsV2)}) then {
			[QGVAR(settings), "save"] call CBA_fnc_localEvent;
		};
		[QGVAR(settings), "load"] call CBA_fnc_localEvent;
	}, [], 1] call CBA_fnc_waitAndExecute;
}, []] call CBA_fnc_execNextFrame;

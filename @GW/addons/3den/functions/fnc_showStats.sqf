/*

	[] call GW_3DEN_fnc_showStats

*/
#include "script_component.hpp"

((findDisplay 313) displayCtrl 668) ctrlSetText (format ["Selected: %1 | Units: %2 | Objects: %3 | Groups: %4",(count (get3DENSelected "object")),({_x isKindOf "CAManBase"} count (all3DENEntities select 0)),({!(_x isKindOf "CAManBase")} count (all3DENEntities select 0)),(count (all3DENEntities select 1))]);

#include "..\macros.hpp"

[
	QUOT(SETTING(mount_action)),
	"CHECKBOX",
	"Enable vehicle mount actions",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;
[
	QUOT(SETTING(change_action)),
	"CHECKBOX",
	"Enable seat change actions",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;
/* [
	QUOT(SETTING(max_distance)),
	"SLIDER",
	"Maximum distance from vehicle allowed",
	CATEGORY,
	[1, 10, 1.5, 1]
] call CBA_Settings_fnc_init; */
[
	QUOT(SETTING(force_eject)),
	"CHECKBOX",
	"Allow helicopter crew to force eject",
	CATEGORY,
	false
] call CBA_Settings_fnc_init;
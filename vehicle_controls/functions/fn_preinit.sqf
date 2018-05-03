#include "..\macros.hpp"

[
	QUOT(SETTING(gear_action)),
	"CHECKBOX",
	"Enable landing gear toggle",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;
[
	QUOT(SETTING(collision_action)),
	"CHECKBOX",
	"Enable collision light toggle",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;
[
	QUOT(SETTING(lights_action)),
	"CHECKBOX",
	"Enable head light toggle",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;
[
	QUOT(SETTING(hover_action)),
	"CHECKBOX",
	"Enable auto-hover toggle",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;
[
	QUOT(SETTING(manual_action)),
	"CHECKBOX",
	"Enable manual fire toggle",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;
[
	QUOT(SETTING(engine_action)),
	"CHECKBOX",
	"Enable engine on/off toggle",
	CATEGORY,
	true
] call CBA_Settings_fnc_init;
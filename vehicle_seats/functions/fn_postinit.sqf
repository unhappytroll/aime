#include "..\macros.hpp"

private _change_seat = [
	QUOT(CLAS(change_action)),
	"Change Seat",
	"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_getincargo.paa",
	{},
	{
		params [
			"_target",
			"_player",
			"_inside"
		];

		SETTING(change_action)
		&& { vehicle _player != _player }
		&& { !(_player call SFNC(operating_uav)) };
	},
	FNC(change_menus),
	true
] call ace_interact_menu_fnc_createAction;
private _getin = {
	params [
		"_target",
		"_player",
		"_inside"
	];

	private _args = (((_this call FNC(seat_menus)) select 0) select 0) select 6;

	_player action _args;
};
private _mount = [
	QUOT(CLAS(mount_action)),
	"Get In",
	"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_getin_ca.paa",
	_getin,
	{
		params [
			"_target",
			"_player",
			"_inside"
		];

		SETTING(mount_action)
		&& { !(_player in _target) }
		&& { [_player, _target] call FNC(can_enter) }
		&& { count (_this call FNC(seat_menus)) != 0 };
	},
	FNC(seat_menus),
	false
] call ace_interact_menu_fnc_createAction;

["CAManBase", 1, ["ACE_SelfActions"], _change_seat, true] call ace_interact_menu_fnc_addActionToClass;
["LandVehicle", 0, ["ACE_MainActions"], _mount, true] call ace_interact_menu_fnc_addActionToClass;
["Air", 0, ["ACE_MainActions"], _mount, true] call ace_interact_menu_fnc_addActionToClass;
["Ship", 0, ["ACE_MainActions"], _mount, true] call ace_interact_menu_fnc_addActionToClass;

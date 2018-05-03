#include "..\macros.hpp"

#define ICON_DRIVER "\A3\ui_f\data\igui\cfg\actions\getindriver_ca.paa"
#define ICON_PILOT "\A3\ui_f\data\igui\cfg\actions\getinpilot_ca.paa"
#define ICON_GUNNER "\A3\ui_f\data\igui\cfg\actions\getingunner_ca.paa"
#define ICON_COMMANDER "\A3\ui_f\data\igui\cfg\actions\getincommander_ca.paa"
#define ICON_CARGO "\A3\ui_f\data\igui\cfg\actions\getincargo_ca.paa"
#define TEXT_DRIVER localize "str_getin_pos_driver"
#define TEXT_PILOT localize "str_getin_pos_pilot"
#define TEXT_CARGO localize "str_getin_pos_cargo"

params [
	"_target",
	"_player",
	"_inside"
];

private _vehicle = if (_inside) then { vehicle _player } else { _target };
private _menus = [];
private _action = if (_inside) then { "MoveTo" } else { "GetIn" };
private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;
private _cargo_i = nil;
private _allowed = {
	isNull _this || { !isPlayer _this && _inside };
};

if (getNumber (_config >> "hasDriver") == 1 && { (driver _vehicle) call _allowed }) then {
	private _action_args = [_action + "Driver", _vehicle];
	private _ace_action = [
		"driver",
		if (_vehicle isKindOf "Air") then { TEXT_PILOT }
		else { TEXT_DRIVER },
		if (_vehicle isKindOf "Air") then { ICON_PILOT }
		else { ICON_DRIVER },
		{ (_this select 1) action (_this select 2) },
		{ true },
		nil,
		_action_args
	] call ace_interact_menu_fnc_createAction;

	_menus pushBack [_ace_action, [], _vehicle];
};
{
	private _icon = if (_x == "commander") then { ICON_COMMANDER }
	else { ICON_GUNNER };

	{
		if ((_x select 0) call _allowed) then {
			private _path = _x select 3;
			private _action_args = [_action + "Turret", _vehicle, _path];
			private _turret = [_vehicle, _path] call CBA_fnc_getTurret;
			private _ace_action = [
				format ["turret_%1", _path],
				getText (_turret >> "gunnerName"),
				_icon,
				{ (_this select 1) action (_this select 2) },
				{ true },
				nil,
				_action_args
			] call ace_interact_menu_fnc_createAction;

			_menus pushBack [_ace_action, [], _vehicle];
		};
	} forEach fullCrew [_vehicle, _x, true];
} forEach ["gunner", "commander", "turret"];
{
	private _occupant = _x select 0;

	if (_occupant call _allowed) then {
		_cargo_i = _x select 2;
	};
	if (_occupant == _player) exitWith { _cargo_i = nil };
	if (isNull _occupant) exitWith { nil };
} forEach fullCrew [_vehicle, "cargo", true];
if (!isNil "_cargo_i") then {
	private _action_args = [_action + "Cargo", _vehicle, _cargo_i];
	private _ace_action = [
		"cargo",
		TEXT_CARGO,
		ICON_CARGO,
		{ (_this select 1) action (_this select 2) },
		{ true },
		nil,
		_action_args
	] call ace_interact_menu_fnc_createAction;

	_menus pushBack [_ace_action, [], _vehicle];
};
_menus;
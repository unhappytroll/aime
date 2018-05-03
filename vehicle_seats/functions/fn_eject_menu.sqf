#include "..\macros.hpp"

params [
	"_target",
	"_player",
	"_inside"
];

private _vehicle = if (_inside) then { vehicle _player } else { _target };
private _submenus = {
	private _sub = [
		"eject",
		"Eject",
		"\a3\ui_f\data\igui\cfg\actions\eject_ca.paa",
		{ [_this select 1, _this select 0] call FNC(eject) },
		{
			params [
				"_target",
				"_player",
				"_args"
			];

			_target call FNC(cangetout)
			&& { [_player, _target] call FNC(can_eject) >= 0 };
		}
	] call ace_interact_menu_fnc_createAction;

	[[_sub, [], _this select 0]];
};
private _modify = {
	params [
		"_target",
		"_player",
		"_args",
		"_menu"
	];

	private _cangetout = _target call FNC(cangetout);
	private _text = if (_cangetout) then { "Get Out" }
	else { "Eject" };
	private _icon = if (_cangetout) then { "\a3\ui_f\data\igui\cfg\actions\getout_ca.paa" }
	else { "\a3\ui_f\data\igui\cfg\actions\eject_ca.paa" };
	_menu set [1, _text];
	_menu set [2, _icon];
};
private _ace_action = [
	QUOT(CLAS(exit_action)),
	"",
	"",
	{
		params [
			"_target",
			"_player",
			"_args"
		];

		if (_target call FNC(cangetout)) then {
			_player action ["GetOut", _target];
		}
		else {
			[_player, _target] call FNC(eject);
		};
	},
	{
		params [
			"_target",
			"_player",
			"_args"
		];

		_target call FNC(cangetout)
		|| { [_player, _target] call FNC(can_eject) != EJECT_TYPE_NONE };
	},
	_submenus,
	nil,
	nil,
	nil,
	nil,
	_modify
] call ace_interact_menu_fnc_createAction;

[_ace_action, [], _vehicle];

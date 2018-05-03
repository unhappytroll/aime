#include "..\macros.hpp"

params [
	"_target",
	"_player",
	"_inside"
];

private _vehicle = if (_inside) then { vehicle _player } else { _target };
private _eject_menu = _this call FNC(eject_menu);

if ([_player, _vehicle] call FNC(can_change)) then {
	(_this call FNC(seat_menus)) + [_eject_menu];
}
else {
	[_eject_menu];
};
params [
	"_unit",
	"_vehicle"
];

if (
	[side _unit, side _vehicle] call BIS_fnc_sideIsEnemy
	|| { locked _vehicle > 1 }
) exitWith { false };
{
	if (isNull (_x select 0)) exitWith { true };
	false;
} forEach fullCrew [_vehicle, "", true];
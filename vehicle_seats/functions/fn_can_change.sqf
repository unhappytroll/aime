#include "..\macros.hpp"

params [
	"_unit",
	"_vehicle"
];

if (
	(!isMultiplayer && { _unit != effectiveCommander _vehicle })
	|| { isTurnedOut _unit }
) exitWith { false };
{
	if (_vehicle isKindOf _x) exitWith { false };
	true;
} forEach ["ParachuteBase", "Ejection_Seat_Base_F"];
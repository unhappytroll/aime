#include "..\macros.hpp"

params [
	"_unit",
	"_vehicle"
];

if (
	!isMultiplayer && { _unit != effectiveCommander _vehicle }
	|| { _unit call SFNC(operating_uav) }
	|| { isTurnedOut _unit }
) exitWith { false };
{
	if (_vehicle isKindOf _x) exitWith { false };
	true;
} forEach ["ParachuteBase", "Ejection_Seat_Base_F"];
params [
	"_unit",
	"_vehicle"
];

if (
	(UAVControl getConnectedUAV _player) select 1 != ""
	|| { _unit != effectiveCommander _vehicle }
	|| { isTurnedOut _unit }
) exitWith { false };
{
	if (_vehicle isKindOf _x) exitWith { false };
	true;
} forEach ["ParachuteBase", "Ejection_Seat_Base_F"];
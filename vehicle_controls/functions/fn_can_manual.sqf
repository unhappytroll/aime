#include "..\macros.hpp"

params [
	"_unit",
	"_vehicle"
];

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;

if (
	getNumber (_config >> "enableManualFire") == 0
	|| { isPlayer gunner _vehicle }
) exitWith { false };
if (_vehicle isKindOf "Helicopter" || { unitIsUAV _vehicle }) then {
	[_unit, _vehicle] call FNC(is_driver);
}
else {
	_unit == commander _vehicle;
};
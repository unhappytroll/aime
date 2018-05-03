// returns a list of animation phases whose names contain _name
params [
	"_vehicle",
	"_name"
];

((animationNames _vehicle) select {
	_x find _name != -1;
}) apply {
	_vehicle animationPhase _x;
};
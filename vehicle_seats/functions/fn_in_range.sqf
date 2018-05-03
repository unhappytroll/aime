params [
	"_from",
	"_to",
	"_range"
];

private _start = eyePos _from;
private _end = _start vectorAdd ((eyeDirection _from) vectorMultiply _range);

count lineIntersectsWith [_start, _end] != 0;
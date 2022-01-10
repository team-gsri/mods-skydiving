params["_target", "_player", "_markerClassname"];

private _marker = _markerClassname createVehicle getPos player;
_marker attachTo [_target, [0,0,0.2]];
_player removeMagazineGlobal _markerClassname;

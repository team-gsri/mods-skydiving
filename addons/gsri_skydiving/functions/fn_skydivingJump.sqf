// Two main modes : newtonian, or realistic.
params ["_unit", "_role", "_vehicle", "_turret"];

if!(_vehicle isKindOf "plane") exitWith {};
if(getPosATL player select 2 < 10) exitWith {};

if(gsri_skydiving_mode isEqualTo "newtonian") then {
	_unit setDir (getDir _vehicle + 180);
    private _planeVelocity = velocityModelSpace _vehicle;
    _unit setVelocityModelSpace [_planeVelocity#0, 0-(_planeVelocity#1), _planeVelocity#2-3];
} else {
	if(gsri_skydiving_mode isEqualTo "immersive") then {
		diag_log "GSRI Skydiving : asking for immersive mode but not implemented yet. Abort.";
	} else {
		diag_log "GSRI Skydiving : unable to retrieve skydiving mode. Abort.";
	};
};
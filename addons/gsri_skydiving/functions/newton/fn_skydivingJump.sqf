/*
 * Author: www.gsri.team
 * Triggered when exiting a vehicle, will add momentum to a player if the exited vehicle matches some criterias.
 *
 * Arguments:
 ** GetOutMan EH standards, see https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#GetOutMan
 *
 * Return Value:
 * None
 *
 * Example:
 * None, started by eventhandler set up in postInit phase, see CfgFunctions > gsri_skydiving > newton > skydivingInit
 *
 * Public: No
 */
 if!(gsri_skydiving_enabled) exitWith {};

params ["_unit", "_role", "_vehicle", "_turret"];

if!(_vehicle isKindOf "plane") exitWith {};
if(getPosATL player select 2 < 10) exitWith {};

_unit setDir (getDir _vehicle + 180);
private _planeVelocity = velocityModelSpace _vehicle;
_unit setVelocityModelSpace [_planeVelocity#0, 0-(_planeVelocity#1), _planeVelocity#2-3];

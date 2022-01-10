/*
 * Author: www.gsri.team
 * Will actually deploy (spawn and attach) the marker to the player's belt.
 *
 * Arguments:
 ** _target          : inherited from general ACE actions, but will always be the player.
 ** _player          : inherited from general ACE actions, of course the player.
 ** _markerClassname : the desired marker type to spawn and attach.
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, player, "SmokeShellGreen"] call gsri_skydiving_fnc_markerInit
 *
 * Public: No
 */
 params["_target", "_player", "_markerClassname"];

private _marker = _markerClassname createVehicle getPos player;
_marker attachTo [_target, [0,0,0.2]];
_player removeMagazineGlobal _markerClassname;

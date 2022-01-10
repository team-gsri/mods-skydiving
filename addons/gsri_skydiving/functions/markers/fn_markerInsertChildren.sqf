/*
 * Author: www.gsri.team
 * Internal workings of the ACE action allowing to chose a marker type based on the player's inventory.
 *
 * Arguments:
 ** ACE action standards, see https://ace3mod.com/wiki/framework/interactionMenu-framework.html
 *
 * Return Value:
 ** _actions : an array of action parameters for each available marker type.
 *
 * Example:
 * [player] call gsri_skydiving_fnc_markerInsertChildren
 *
 * Public: No
 */
params ["_target", "_player", "_params"];
private _availableMarkers = magazines player select { (_x call BIS_fnc_itemType) # 1 == "SmokeShell" };
private _availableMarkersUnique = [];
{ _availableMarkersUnique pushBackUnique _x } forEach _availableMarkers;
private _actions = [];
{
  private _child = [
    format["gsri_skydiving_deployMarker_%1", _x],
    [configFile >> "CfgMagazines" >> _x] call BIS_fnc_displayName,
    (configFile >> "CfgMagazines" >> _x >> "picture") call BIS_fnc_getCfgData,
    gsri_skydiving_fnc_markerDeploy,
    {true},
    {},
    _x] call ace_interact_menu_fnc_createAction;
  _actions pushBack [_child, [], _target];
} forEach _availableMarkersUnique;
_actions

/*
 * Author: www.gsri.team
 * Initialize ACE actions usable by players travelling under a parachute, allowing them to attach a smokeshell or chemlight (hereafter called "marker") to their belt.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None, autostarted in postInit phase, see CfgFunctions > gsri_skydiving > markers > markerInit
 *
 * Public: No
 */
private _actionMarkerRoot = [
  "gsri_skydiving_deployMarker",
  localize "STR_GSRI_Skydiving_deployMarker",
  "\a3\Modules_F_Curator\Data\iconSmoke_ca.paa",
  {},
  {true},
  gsri_skydiving_fnc_markerInsertChildren] call ace_interact_menu_fnc_createAction;
["ParachuteBase", 1, ["ACE_SelfActions"], _actionMarkerRoot, true] call ace_interact_menu_fnc_addActionToClass;

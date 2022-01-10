// Adds action to check fuel levels for all land vehicles
private _actionMarkerRoot = [
  "gsri_skydiving_deployMarker",
  localize "STR_GSRI_Skydiving_deployMarker",
  "\a3\Modules_F_Curator\Data\iconSmoke_ca.paa",
  {},
  {true},
  gsri_skydiving_fnc_markerInsertChildren] call ace_interact_menu_fnc_createAction;
["ParachuteBase", 1, ["ACE_SelfActions"], _actionMarkerRoot, true] call ace_interact_menu_fnc_addActionToClass;

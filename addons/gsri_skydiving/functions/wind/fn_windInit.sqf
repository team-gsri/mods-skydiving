// Adds action to display wind info while under parachute
private _actionWindInfo = [
  "gsri_skydiving_windInfo",
  localize "STR_GSRI_Skydiving_windInfo",
  "fr\gsri\skydiving\ui\wind_ca.paa",
  gsri_skydiving_fnc_displayWindInfo,
  {true}] call ace_interact_menu_fnc_createAction;
["ParachuteBase", 1, ["ACE_SelfActions"], _actionWindInfo, true] call ace_interact_menu_fnc_addActionToClass;

// Event handler for auto closing of wind info when touching ground, otherwise will conflict with ACE's version.
player addEventHandler ["GetOutMan", {
  params ["_unit", "_role", "_vehicle", "_turret"];
  if(!(local _unit) || !(_vehicle isKindOf "ParachuteBase")) exitWith {};
  if(gsri_skydiving_windInfo) then {
    [] call gsri_skydiving_fnc_displayWindInfo;
  };
}];

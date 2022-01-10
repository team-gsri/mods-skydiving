/*
 * Author: www.gsri.team
 * Will add the required CBA setting for enabling/disabling the newtonian freefall simulation mid-mission.
 * The setting is server-forced.
 * No mission restart is required when changed.
 * See https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System#create-a-custom-setting-for-mission-or-mod
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None, started by CBA extended event handlers in preInit phase, see Extended_PreInit_EventHandlers > gsri_skydiving > init
 *
 * Public: No
 */
[
  "gsri_skydiving_enabled",
  "CHECKBOX",
  [localize "STR_GSRI_Skydiving_enabled", localize "STR_GSRI_Skydiving_enabled_tooltip"],
  "GSRI Skydiving",
  true,
  1,
  {},
  false
] call CBA_fnc_addSetting;

/*
 * Author: www.gsri.team
 * Will add the required CBA setting for enabling/disabling the newtonian freefall simulation mid-mission.
 *  The setting is server-forced.
 *  No mission restart is required when changed.
 *  See https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System#create-a-custom-setting-for-mission-or-mod
 * Will also add a custom keybind to open parachute mid-air
 *  The keybind is defaulted to Spacebar (0x39) and locally customizable
 *  No mission restart is required when changed.
 *  See https://cbateam.github.io/CBA_A3/docs/files/keybinding/fnc_addKeybind-sqf.html
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

[
  "GSRI Skydiving",
  "gsri_skydiving_openParachute",
  [localize "STR_GSRI_Skydiving_openParachute", localize "STR_GSRI_Skydiving_openParachute_tooltip"],
  {
    if!(vehicle player == player) exitWith {};
    if!(getPos player select 2 > 70) exitWith {};
    if!(backpack player isKindOf "B_Parachute") exitWith {};
    player action ["OpenParachute", player];
    playSound "gsri_skydiving_openParachute_sound";
  },
  {},
  [0x39, [false, false, false]]
] call CBA_fnc_addKeybind

// Server-forced setting for skydiving mode
// No restart needed when switching mode.
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

// Server-forced setting for skydiving mode, default being newtonian.
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

[
	"gsri_skydiving_mode",
	"LIST",
	[localize "STR_GSRI_Skydiving_selectMode", localize "STR_GSRI_Skydiving_selectMode_tooltip"],
	"GSRI Skydiving",
	[["newtonian"], ["STR_GSRI_Skydiving_mode_newtonian"], 0],
	1,
	{},
	false
] call CBA_fnc_addSetting;
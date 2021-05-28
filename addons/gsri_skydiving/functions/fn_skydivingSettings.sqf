// Server-forced setting for skydiving mode, default being newtonian.
// No restart needed when switching mode.

[
	"gsri_skydiving_mode",
	"LIST",
	[localize "STR_GSRI_Skydiving_selectMode", localize "STR_GSRI_Skydiving_selectMode_tooltip"],
	"GSRI Skydiving",
	[["newtonian", "immersive"], ["STR_GSRI_Skydiving_mode_newtonian", "STR_GSRI_Skydiving_mode_immersive"], 0],
	1,
	{},
	false
] call CBA_fnc_addSetting;
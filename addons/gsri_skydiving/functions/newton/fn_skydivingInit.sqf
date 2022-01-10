if!(isDedicated) then {
  diag_log "GSRI Skydiving is starting.";

	// Required for both newtonian and immersive modes
	player addEventHandler ["GetOutMan", gsri_skydiving_fnc_skydivingJump];

	// Should also start buttons and stuff for immersive mode

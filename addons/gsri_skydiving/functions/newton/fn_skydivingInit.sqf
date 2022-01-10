if!(isDedicated) then {
  diag_log "GSRI Skydiving is starting.";
  player addEventHandler ["GetOutMan", gsri_skydiving_fnc_skydivingJump];
};

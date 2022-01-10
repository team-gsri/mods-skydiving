/*
 * Author: www.gsri.team
 * Will add required event handlers to make the newtonian freefall actually work.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None, autostarted in postInit phase, see CfgFunctions > gsri_skydiving > newton > skydivingInit
 *
 * Public: No
 */
if!(isDedicated) then {
  diag_log "GSRI Skydiving is starting.";
  player addEventHandler ["GetOutMan", gsri_skydiving_fnc_skydivingJump];
};

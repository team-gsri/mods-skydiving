/*
 * Author: www.gsri.team
 * Forked version of Ruthberg's displayWindInfo for ACE Weather (https://github.com/acemod/ACE3/blob/master/addons/weather/functions/fnc_displayWindInfo.sqf)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call gsri_skydiving_fnc_displayWindInfo
 *
 * Public: No
 */

if (gsri_skydiving_windInfo) exitWith {
    gsri_skydiving_windInfo = false;
    (["RscWindIntuitive"] call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
    true
};

ace_advanced_ballistics_Protractor = false;
1 cutText ["", "PLAIN"];
gsri_skydiving_windInfo = true;

[{
    disableSerialization;
    params ["", "_pfID"];

    if (!gsri_skydiving_windInfo || {!([ACE_player, ACE_player, []] call ace_common_fnc_canInteractWith) && !(vehicle ACE_player isKindOf "ParachuteBase")}) exitWith {
        gsri_skydiving_windInfo = false;
        (["RscWindIntuitive"] call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };

    //Keeps the display open:
    (["RscWindIntuitive"] call BIS_fnc_rscLayer) cutRsc ["RscWindIntuitive", "PLAIN", 1, false];

    private _windSpeed = if (missionNamespace getVariable ["ace_advanced_ballistics_enabled", false]) then {
        // With wind gradient
        [eyePos ACE_player, true, true, true] call gsri_skydiving_fnc_calculateWindSpeed;
    } else {
        // Without wind gradient
        [eyePos ACE_player, false, true, true] call gsri_skydiving_fnc_calculateWindSpeed;
    };

    private _playerDir = (ACE_player call CBA_fnc_headDir) select 0;
    private _windDir = (wind select 0) atan2 (wind select 1);
    _windDir = 30 * (round(((_windDir - _playerDir + 360) % 360) / 30));

    // Color Codes from https://en.wikipedia.org/wiki/Beaufort_scale#Modern_scale
    private _beaufortNumber = 0;
    private _windColor = [1, 1, 1, 1];
    if (_windSpeed > 0.3) then { _windColor = [0.796, 1, 1, 1]; _beaufortNumber = 1; };
    if (_windSpeed > 1.5) then { _windColor = [0.596, 0.996, 0.796, 1]; _beaufortNumber = 2; };
    if (_windSpeed > 3.3) then { _windColor = [0.596, 0.996, 0.596, 1]; _beaufortNumber = 3; };
    if (_windSpeed > 5.4) then { _windColor = [0.6, 0.996, 0.4, 1]; _beaufortNumber = 4; };
    if (_windSpeed > 7.9) then { _windColor = [0.6, 0.996, 0.047, 1]; _beaufortNumber = 5; };
    if (_windSpeed > 10.7) then { _windColor = [0.8, 0.996, 0.059, 1]; _beaufortNumber = 6; };
    if (_windSpeed > 13.8) then { _windColor = [1, 0.996, 0.067, 1]; _beaufortNumber = 7; };
    if (_windSpeed > 17.1) then { _windColor = [1, 0.796, 0.051, 1]; _beaufortNumber = 8; };
    if (_windSpeed > 20.7) then { _windColor = [1, 0.596, 0.039, 1]; _beaufortNumber = 9; };
    if (_windSpeed > 24.4) then { _windColor = [1, 0.404, 0.031, 1]; _beaufortNumber = 10; };
    if (_windSpeed > 28.4) then { _windColor = [1, 0.22, 0.027, 1]; _beaufortNumber = 11; };
    if (_windSpeed > 32.6) then { _windColor = [1, 0.078, 0.027, 1]; _beaufortNumber = 12; };


    ((uiNamespace getVariable "RscWindIntuitive") displayCtrl 132948) ctrlSetTextColor _windColor;
    if (_beaufortNumber > 0) then {
        ((uiNamespace getVariable "RscWindIntuitive") displayCtrl 132948) ctrlSetText "z\ace\addons\weather\UI\wind_arrow_ca.paa";
        ((uiNamespace getVariable "RscWindIntuitive") displayCtrl 132948) ctrlSetAngle [_windDir, 0.5, 0.5];
    } else {
        ((uiNamespace getVariable "RscWindIntuitive") displayCtrl 132948) ctrlSetText "z\ace\addons\weather\UI\wind_noneCircle_ca.paa";
    };
    ((uiNamespace getVariable "RscWindIntuitive") displayCtrl 132948) ctrlCommit 0;
}, 0.5, []] call CBA_fnc_addPerFrameHandler;

true
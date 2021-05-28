class CfgPatches {
	class gsri_skydiving {
		units[]={};
		requiredVersion=0.1;
		requiredAddons[]={"cba_settings"};
		author="www.gsri.team";
	};
};

class Extended_PreInit_EventHandlers {
	class gsri_skydiving {
		init = "call GSRI_fnc_skydivingSettings";
	};
};

class CfgFunctions {
    class GSRI {
        class para {
            file="gsri_skydiving\functions";
            class skydivingInit { postInit = 1 };
            class skydivingSettings {};
            class skydivingJump {};
        };
    };
};
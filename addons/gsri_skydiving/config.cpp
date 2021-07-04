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
		init = "call gsri_skydiving_fnc_skydivingSettings";
	};
};

class CfgFunctions {
    class gsri_skydiving {
        class newton {
            file="fr\gsri\skydiving\functions\newton";
            class skydivingInit { postInit = 1 };
            class skydivingSettings {};
            class skydivingJump {};
        };
		class markers {
			file = "fr\gsri\skydiving\functions\markers";
			class markerInit { postInit = 1 };
			class markerDeploy {};
			class markerInsertChildren {};
		};
    };
};
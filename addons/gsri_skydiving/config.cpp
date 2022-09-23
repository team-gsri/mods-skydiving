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
    class wind {
      file = "fr\gsri\skydiving\functions\wind";
      class windInit { postInit = 1 };
      class displayWindInfo {};
      class calculateWindSpeed {};
    };
  };
};

class CfgSounds {
  // Creative Commons, Eugene Everett, https://freesound.org/people/EugeneEverett/sounds/596522/
  class gsri_skydiving_openParachute_sound {
    name = "Parachute opening";
    sound[] = {"fr\gsri\skydiving\sounds\parachute_opening.ogg", 5, 1};
    titles[] = {0, ""};
  };
};

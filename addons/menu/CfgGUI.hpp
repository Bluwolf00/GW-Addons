/*
	class RscPicture;
	class RscFrame;
	class RscText;
	class RscListbox;
	class RscControlsGroup;
	class RscCombo;
	class RscButton;
	class RscStructuredText;
*/

class RscButtonMenu;
class RscStandardDisplay;
class GW_MainMenu_Client: RscButtonMenu {
	action="(findDisplay 49) closeDisplay 0; ['player', [], 100, ['(call GW_Menu_fnc_flexi_InteractSelf)','main']] call cba_fnc_fleximenu_openMenuByDef";
	text="Player Menu";
	tooltip="Personal Settings";
	x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
	y = "4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safezoneY";
	w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
};

class RscDisplayInterrupt: RscStandardDisplay {
	class controls {
		class GW_MainMenu_Client: GW_MainMenu_Client {};
		delete BloodLustSettingsButton;
	};
};
class RscDisplayMPInterrupt: RscDisplayInterrupt {
	class controls {
		class GW_MainMenu_Client: GW_MainMenu_Client {};
		delete BloodLustSettingsButton;
	};
};
class RscDisplayInterruptEditor3D: RscDisplayInterrupt {
	class controls {
		class GW_MainMenu_Client: GW_MainMenu_Client {};
	};

};
class RscDisplayInterruptEditorPreview: RscDisplayInterrupt {
	class controls {
		class GW_MainMenu_Client: GW_MainMenu_Client {};
	};
};

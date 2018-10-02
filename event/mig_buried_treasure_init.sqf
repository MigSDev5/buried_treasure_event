private ["_pic","_hint"];

//-----------loot config -------
TreasureLootList = [
[
["M9SD","FN_FAL","M4A3_CCO_EP1","AKS_74_kobra","Sa58V_RCO_EP1","ItemEtool","ItemCrowbar","ItemKnife","ItemSledge","ItemCompass","Binocular","Binocular_Vector","NVGoggles","ItemGPS"],
["ItemBriefcase100oz","150Rnd_127x107_DSHKM","20Rnd_762x51_FNFAL","20Rnd_762x51_FNFAL","20Rnd_762x51_FNFAL","30Rnd_762x39_SA58","30Rnd_762x39_SA58","30Rnd_762x39_SA58","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD"]
],
[
["M4A1_HWS_GL_SD_Camo","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL","M16A4_ACG","M4A1","M4A1_HWS_GL","M4A1_HWS_GL_camo","M4A1_HWS_GL_SD_Camo","M4A1_RCO_GL","M4A1_Aim","M4A1_Aim_camo","M4A1_AIM_SD_camo"],
["ItemBriefcase100oz","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor"]
],
[
["ItemToolbox","M4A1_HWS_GL_SD_Camo","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL","M16A4_ACG","M4A1","M4A1_HWS_GL","M4A1_HWS_GL_camo","M4A1_HWS_GL_SD_Camo","M4A1_RCO_GL","M4A1_Aim","M4A1_Aim_camo","M4A1_AIM_SD_camo"],
["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor","metal_floor_kit","ItemWoodFloor"]
],
[
["ChainSaw"],
["ItemBriefcase100oz","ItemBriefcase100oz","ItemCorrugated","ItemCorrugated","ItemCorrugated","ItemCorrugated","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole","ItemComboLock","ItemGenerator"]
],
[
["m240_scoped_EP1_DZE","Mk_48_DZ","M240_DZ","RPK_74"],
["ItemBriefcase100oz","100Rnd_762x51_M240","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_762x51_M240","100Rnd_762x51_M240","200Rnd_556x45_M249","2000Rnd_762x51_M134","2000Rnd_762x51_M134","ItemAVE","ItemLRK","ItemTNK","ItemARM","ItemORP","ItemSeaBassCooked","ItemSeaBassCooked","ItemSeaBassCooked","ItemSeaBassCooked","ItemSeaBassCooked","ItemSeaBassCooked","ItemSeaBassCooked","ItemSeaBassCooked","ItemSeaBassCooked","ItemSeaBassCooked"]
],
[
["M4A1_HWS_GL_SD_Camo","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL","M16A4_ACG","M4A1","M4A1_HWS_GL","M4A1_HWS_GL_camo","M4A1_HWS_GL_SD_Camo","M4A1_RCO_GL","M4A1_Aim","M4A1_Aim_camo","M4A1_AIM_SD_camo"],
["ItemBriefcase100oz","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","FoodCanFrankBeans","FoodCanFrankBeans","FoodCanBakedBeans","FoodMRE","HandGrenade_east","2000Rnd_762x51_M134","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks"]
],
[
["VSS_vintorez","Saiga12K","M8_compact"],
["ItemBriefcase100oz","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","HandGrenade_east","HandGrenade_east","FoodCanSardines","FoodMRE","FoodPistachio","FoodNutmix","FoodMRE","FoodPistachio","FoodNutmix","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks"]
]
];
//---------- end config------------

"treasureMessage" addPublicVariableEventHandler {
    _pic = "scripts\event\buried_treasure.paa";
    _hint = parseText format["<t align='center' color='#06C46E' shadow='2' size='1.75'>Buried Treasure</t><br/><br/><t align='center'><img size='7' image='%1'/></t><br/><br/><t align='center' color='#06C46E'>Find the treasure located on the map.</t><br/><t align='center' color='#06C46E'>Beware, some maybe body traped !!</t>",_pic];
    hint _hint;
};
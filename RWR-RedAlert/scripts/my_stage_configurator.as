#include "stage_configurator_campaign.as"

// ------------------------------------------------------------------------------------------------
class MyStageConfigurator : StageConfiguratorCampaign {
	// ------------------------------------------------------------------------------------------------
	MyStageConfigurator(GameModeInvasion@ metagame, MapRotatorCampaign@ mapRotator) {
		super(metagame, mapRotator);
	}

	// ------------------------------------------------------------------------------------------------
	const array<FactionConfig@>@ getAvailableFactionConfigs() const {
		array<FactionConfig@> availableFactionConfigs;

		availableFactionConfigs.push_back(FactionConfig(-1, "green.xml", "Allied Forces", "0.0 0.6 1.0", "green.xml"));
		availableFactionConfigs.push_back(FactionConfig(-1, "brown.xml", "Soviet Union", "1.0 0.0 0.0", "green.xml"));
		availableFactionConfigs.push_back(FactionConfig(-1, "grey.xml", "Yuri's Army", "0.7 0.35 0.9", "brown.xml"));

		return availableFactionConfigs;
	}

}

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

		// --------------------------------
		// TODO: define 3 faction configs here
		// - "green.xml" faction specification filename
		// - "Greenbelts" faction name, usually same as the one in the file
		// - "0.1 0.5 0" color used for faction in the world view
		// - "green_boss.xml" faction specification filename used in the final missions; 
		//   can be same as the regular faction filename
		// --------------------------------

		availableFactionConfigs.push_back(FactionConfig(-1, "green.xml", "Allies", "0.1 0.5 0", "green.xml"));
		availableFactionConfigs.push_back(FactionConfig(-1, "brown.xml", "Soviet Union", "0.5 0.25 0", "brown.xml"));
		availableFactionConfigs.push_back(FactionConfig(-1, "grey.xml", "Epsilon", "0.5 0.5 0.5", "grey.xml"));

		return availableFactionConfigs;
	}

	// NOTE
	// if you need to add certain resources for enemies or friendlies generally in all stages, have a look at
	// vanilla\scripts\gamemodes\invasion\stage_configurator_invasion.as and consider overriding
	// getCommonFactionResourceChanges
	// getFriendlyFactionResourceChanges
	// getCompletionVarianceCommands
}

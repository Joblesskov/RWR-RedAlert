#include "item_delivery_configurator_invasion.as"

// ------------------------------------------------------------------------------------------------
class MyItemDeliveryConfigurator : ItemDeliveryConfiguratorInvasion {
	// ------------------------------------------------------------------------------------------------
	MyItemDeliveryConfigurator(GameModeInvasion@ metagame) {
		super(metagame);
	}

	// --------------------------------------------
	array<Resource@>@ getUnlockWeaponList() const {
		array<Resource@> list;

		// --------------------------------------------
		// TODO:
		// - replace these with suitable items for briefcase delivery rewards
		// --------------------------------------------

		// list.push_back(Resource("l85a2.weapon", "weapon"));

		return list;
	}

	// --------------------------------------------
	array<Resource@>@ getUnlockWeaponList2() const {
		array<Resource@> list;

		// --------------------------------------------
		// TODO:
		// - replace these with suitable items for laptop delivery rewards
		// --------------------------------------------

		return list;
	}
	
	// --------------------------------------------
	array<Resource@>@ getDeliverablesList() const {
		array<Resource@> list;

		// --------------------------------------------
		// TODO:
		// - replace these with what we want to track as delivered to armory, with intention of unlocking that same item
		// --------------------------------------------
		
		return list;
	}

	// --------------------------------------------
	// NOTE:
	// also see vanilla\scripts\gamemodes\invasion\item_delivery_configurator_invasion.as:
	// protected void setupGift1()
	// protected void setupGift2()
	// protected void setupGift3()

}

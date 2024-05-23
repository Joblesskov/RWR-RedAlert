#include "vehicle_delivery_configurator_invasion.as"

// ------------------------------------------------------------------------------------------------
class MyVehicleDeliveryConfigurator : VehicleDeliveryConfiguratorInvasion {
	// ------------------------------------------------------------------------------------------------
	MyVehicleDeliveryConfigurator(GameModeInvasion@ metagame) {
		super(metagame);
	}

	// --------------------------------------------
	protected array<Resource@>@ getUnlockItemList() const {
		array<Resource@> list;

		// --------------------------------------------
		// TODO:
		// - replace these with suitable items for cargo truck delivery rewards
		// --------------------------------------------
         
		return list;
	}
}


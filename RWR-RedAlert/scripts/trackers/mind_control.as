#include "tracker.as"
#include "helpers.as"
#include "admin_manager.as"
#include "log.as"
#include "query_helpers.as"
#include "query_helpers2.as"
#include "gamemode.as"
#include "time_announcer_task.as"

class MindControl : Tracker {
	protected Metagame@ m_metagame;

	MindControl(Metagame@ metagame) {
		@m_metagame = @metagame;
	}
	
	protected void handleResultEvent(const XmlElement@ event) {

		string sourceKey = event.getStringAttribute("key");
		if (sourceKey != "mind_control") return;
		
		float range = 1.5;

		// immune to mind control
		array<string> immuneKeys = {
			"wy_mind_control.weapon",
			"wy_mind_control_e.weapon",
			"ws_akm.weapon",
			"wa_colt_m1911.weapon",
			"dog.weapon"
		};

		// get controller
        int controllerId = event.getIntAttribute("character_id");
		Vector3 controlPos = stringToVector3(event.getStringAttribute("position"));
		const XmlElement@ controller = getCharacterInfo(m_metagame, controllerId);
		int factionId = controller.getIntAttribute("faction_id");

		for (uint f = 0; f < 4; f++) {
			// skip own faction
			if (factionId == f) continue;

			// get all characters in range
			array<const XmlElement@>@ characters = getCharactersNearPosition(m_metagame, controlPos, f, range);

			// continue if no characters in range
			uint total_soldier_count = characters.length();
			if (total_soldier_count == 0) continue;

			// control only one character
			int targetId = characters[0].getIntAttribute("id");
			const XmlElement@ target = getCharacterInfo2(m_metagame, targetId);
			string targetPos = target.getStringAttribute("position");
			string targetGroup = target.getStringAttribute("soldier_group_name");

			// check if target is immune to mind control
			array<const XmlElement@>@ equipment = target.getElementsByTagName("item");
			if (equipment.size() > 0) {
				string weapon0 = equipment[0].getStringAttribute("key");
				if (immuneKeys.find(weapon0) != -1) continue;
			}

			// kill target
			string command1 =
				"<command class='update_character' " +
				"	id='" + targetId + "' " +
				"	dead='1' " +
				"/>"; 

			// create new character
			string command2 = 
				"<command class='create_instance' " +
				"	faction_id='" + factionId + "' " +
				"	position='" + targetPos + "' " +
				"	instance_class='character' " +
				"	instance_key='" + targetGroup + "' " +
				"/>";

			// reward xp
			string command3 =
				"<command class='xp_reward' " +
				"	character_id='" + controllerId + "' " +
				"	reward='0.001' " +
				"/>";

			m_metagame.getComms().send(command1);
			m_metagame.getComms().send(command2);
			m_metagame.getComms().send(command3);
		}
	}
};


// class MindControl : Tracker {
// 	protected Metagame@ m_metagame;

//     MindControl(Metagame@ metagame) {
// 		@m_metagame = @metagame;
// 	}

// 	protected void handleCharacterKillEvent(const XmlElement@ event) {
// 		const XmlElement@ killer = event.getFirstElementByTagName("killer");
// 		const XmlElement@ target = event.getFirstElementByTagName("target");
//         string killKey = event.getStringAttribute("key");
// 		string targetGroup = target.getStringAttribute("soldier_group_name");
		
// 		bool checkKey = killKey == "ws_mind_control.weapon" || killKey == "ws_mind_control_e.weapon";
// 		bool checkGroup = targetGroup != "dog" && targetGroup != "default" && targetGroup != "psicorp";
// 		if (killer !is null && target !is null && checkKey && checkGroup) {
			
// 			string command = 
// 				"<command "+
// 				"class='create_instance' "+
// 				"faction_id='" + killer.getIntAttribute("faction_id") + "' "+
// 				"position='" + target.getStringAttribute("position") + "' "+
// 				"instance_class='character' "+
// 				"instance_key='" + targetGroup + "' "+
// 				"/>";

// 			m_metagame.getComms().send(command);
// 		}
// 	}
// }
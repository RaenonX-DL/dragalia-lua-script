States = dofile(scriptPath() .. "script/State.lua")
System = dofile(scriptPath() .. "script/System.lua")
Configs = dofile(scriptPath() .. "script/Configs.lua")
Check = dofile(scriptPath() .. "script/Check.lua")
Counter = dofile(scriptPath() .. "script/RunsCounter.lua")
CustomizeFunctions = dofile(scriptPath() .. "script/CustomizeFunctions.lua")
ActionSet = dofile(scriptPath() .. "script/ActionSet.lua")

Settings:setCompareDimension(true, 1440)
Settings:setScriptDimension(true, 1440)

-- Bundled Actions

------- MAIN -------
while true do
	if States.current_state == States.READY then
		if Check.check_host_left() then
			wait(Configs.HostLeftWaitSeconds)
		else
			Check.check_in_room() -- Prevent unready but set to ready
			Check.check_loading()
		end
	elseif States.current_state == States.LOADING then
		ActionSet.handle_connection_errors(function() end)
		Check.check_battle_begin()
	elseif States.current_state == States.BATTLE_START then
		CustomizeFunctions.battle_begin_actions()
		States.update_state(States.IN_BATTLE)
	elseif States.current_state == States.IN_BATTLE then
		ActionSet.click_common()
		if not Check.check_dead() then
			ActionSet.click_common()
			Check.check_in_battle()
			ActionSet.click_common()
			
			ActionSet.click_common()
			Check.check_end_game()
			ActionSet.click_common()
			
			ActionSet.click_common()
			ActionSet.handle_connection_errors(ActionSet.click_common)
			ActionSet.click_common()
		end
	elseif States.current_state == States.END then
		Counter.count_once()
		
		ActionSet.clicks_postgame_dialogs()
		wait(Configs.PostgameClickCheckWaitSeconds)
		Check.check_post_game()
	elseif States.current_state == States.READY_SCREEN then
		click(Customize.LocationQuestTop)
		
		for i = 1, Configs.DifficultyChecks do
			if Check.check_difficulty_screen() then
				break
			end
			wait(Configs.DifficultyCheckWaitSeconds)
		end
	elseif States.current_state == States.DIFFICULTY then
		click(Customize.LocationDifficultyTop)
		Check.check_room_select()
	elseif States.current_state == States.ROOM_SELECT then
		click(Customize.LocationRandomRoom)
		Check.check_room_finding()
		Check.check_in_room()
		Check.check_insufficient_wings()
	elseif States.current_state == States.FINDING_ROOM then
		Check.check_in_room()
		click(Customize.LocationRandomRoom)
	elseif States.current_state == States.INSUFFICIENT_WINGS then
		ActionSet.clicks_insufficient_wings()
		Check.check_room_finding()
	else
		Check.check_current_state(ActionSet.click_common)
		System.count_analyze_state()
	end
	
	System.generate_toast()
end
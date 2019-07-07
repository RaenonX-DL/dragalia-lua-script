States = dofile(scriptPath() .. "script/State.lua")
System = dofile(scriptPath() .. "script/System.lua")
Configs = dofile(scriptPath() .. "script/Configs.lua")
Check = dofile(scriptPath() .. "script/Check.lua")
Counter = dofile(scriptPath() .. "script/RunsCounter.lua")
Customize = dofile(scriptPath() .. "script/Customize.lua")
CustomizeFunctions = dofile(scriptPath() .. "script/CustomizeFunctions.lua")
ActionSet = dofile(scriptPath() .. "script/ActionSet.lua")

Settings:setCompareDimension(true, Configs.DimensionWidth)
Settings:setScriptDimension(true, Configs.DimensionWidth)

------- MAIN -------
while true do
	if States.current_state == States.COMMON_SCREEN then
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
		Check.check_loading()
	elseif States.current_state == States.FINDING_ROOM then
		Check.check_in_room()
		click(Customize.LocationRandomRoom)
		ActionSet.handle_connection_errors(ActionSet.click_common)
		Check.check_loading()
		Check.check_end_game()
	elseif States.current_state == States.INSUFFICIENT_WINGS then
		ActionSet.clicks_insufficient_wings()
		Check.check_room_finding()
	elseif States.current_state == States.READY then
		if Check.check_host_left() then
			wait(Configs.HostLeftWaitSeconds)
		else
			Check.check_in_room() -- Prevent unready but set to ready
			Check.check_loading()
		end
	elseif States.current_state == States.LOADING then
		System.activate_loading_destucker()
		ActionSet.handle_connection_errors(function() end)
		
		if Check.check_battle_begin() or System.check_destucker_overtime() then
			System.deactivate_loading_destucker()
		end
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
		else
			Check.check_post_game() -- Dead and time up so go backs to the COMMON_SCREEN
		end
	elseif States.current_state == States.END then
		Counter.count_once()
		
		ActionSet.clicks_postgame_dialogs()
		wait(Configs.PostgameClickCheckWaitSeconds)
		Check.check_post_game()
	else
		Check.check_current_state(ActionSet.click_common)
		System.count_analyze_state()
	end
	
	System.generate_toast()
end
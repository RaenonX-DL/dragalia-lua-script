Settings:setCompareDimension(true, Configs.CompareDimensionWidth)
Settings:setScriptDimension(true, Configs.DimensionWidth)

------- MAIN -------

while true do
	if States.current_state == States.COMMON_SCREEN then
		click(Coordinates.LocationQuestTop)
		ActionSet.handle_connection_errors(function() end)
		for i = 1, Configs.FriendSelectChecks do 
			wait(Configs.FriendSelectWaitSeconds)
			if Check.check_friend_select_screen() then break end
		end
	elseif States.current_state == States.FRIEND_SELECT then
		click(Coordinates.LocationMultiPlay)
		Check.check_random_room()
		ActionSet.handle_connection_errors(function() end)
	elseif States.current_state == States.RANDOM_ROOM then
		click(Coordinates.LocationRandomRoom)
		Check.check_room_finding()
		Check.check_in_room()
		Check.check_insufficient_wings()
	elseif States.current_state == States.FINDING_ROOM then
		Check.check_in_room()
		Check.check_in_battle()
		Check.check_end_game()
		click(Coordinates.LocationRandomRoom)
		ActionSet.handle_connection_errors(ActionSet.click_common)
	elseif States.current_state == States.INSUFFICIENT_WINGS then
		ActionSet.clicks_insufficient_wings()
		Check.check_room_finding()
		Check.check_in_room()
	elseif States.current_state == States.READY then
		if Check.check_host_left() then
			wait(Configs.HostLeftWaitSeconds)
		else
			Check.check_in_room()
			Check.check_loading()
			Check.check_battle_begin()
			if ActionSet.handle_connection_errors(function() end) then
				Check.check_post_game()
			end
		end
	elseif States.current_state == States.LOADING then
		ActionSet.handle_connection_errors(function() end)
		Check.check_battle_begin()
        Check.check_end_game()
	elseif States.current_state == States.BATTLE_START then
		System.deactivate_loading_destucker()
		CustomActions.battle_begin_actions()
		States.update_state(States.IN_BATTLE)
	elseif States.current_state == States.IN_BATTLE then
		RunsCounter.counter_ready()
		if not Check.check_dead() then
			for i = 1, 3 do
				ActionSet.click_common()
			end

			if Check.check_in_battle() then
				ActionSet.use_skills()
			end

			for i = 1, 3 do
				ActionSet.click_common()
			end

			Check.check_end_game()

			for i = 1, 3 do
				ActionSet.click_common()
			end

			Check.check_post_game()
			for i = 1, 3 do
				ActionSet.click_common()
			end

			Check.check_center_close_dialog()

			for i = 1, 3 do
				ActionSet.click_common()
			end

			ActionSet.handle_connection_errors(function() end)

			for i = 1, 3 do
				ActionSet.click_common()
			end
		end
	elseif States.current_state == States.BATTLE_DEAD then
		Check.check_end_game()
		doubleClick(Coordinates.LocationCloseMiddleDialog)
		Check.check_post_game()
	elseif States.current_state == States.END then
		RunsCounter.count_once()
		
		ActionSet.clicks_postgame_dialogs()
		wait(Configs.PostgameClickCheckWaitSeconds)
		Check.check_post_game()
	else
		Check.check_current_state(ActionSet.click_common)
		System.count_analyze_state()
	end
	
	System.generate_toast()
end
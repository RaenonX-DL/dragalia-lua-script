Settings:setCompareDimension(true, Configs.DimensionWidth)
Settings:setScriptDimension(true, Configs.DimensionWidth)

------- MAIN -------

while true do
	if States.current_state == States.READY then
		if Check.check_host_left() then
			wait(Configs.HostLeftWaitSeconds)
		else
			Check.check_in_room() -- Prevent unready but set to ready
			Check.check_in_battle()
		end
	elseif States.current_state == States.IN_BATTLE then
		ActionSet.click_common()
		if not Check.check_dead() then
			ActionSet.click_common()
			Check.check_in_battle()
			ActionSet.click_common()

			ActionSet.click_common()
			Check.check_end_game()
			ActionSet.click_common()
		end
	elseif States.current_state == States.BATTLE_DEAD then
		Check.check_end_game()
		doubleClick(Coordinates.LocationCloseMiddleDialog)
		Check.check_post_game()
	elseif States.current_state == States.END then
		ActionSet.clicks_postgame_dialogs()
		wait(Configs.PostgameClickCheckWaitSeconds)
		Check.check_post_game()
	elseif States.current_state == States.COMMON_SCREEN then
		System.terminate("Successfully ended.")
	else
		Check.check_current_state(ActionSet.click_common)
	end
	
	System.generate_toast()
end
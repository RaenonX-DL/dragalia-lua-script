Settings:setCompareDimension(true, Configs.DimensionWidth)
Settings:setScriptDimension(true, Configs.DimensionWidth)

------- MAIN -------
Logger.write_header()

while true do
	if States.current_state == States.IN_BATTLE then
		RunsCounter.counter_ready()
		Check.check_end_game()
		ActionSet.handle_connection_errors(function() end)
		Check.check_center_close_dialog()
	elseif States.current_state == States.END then
		RunsCounter.count_once()
		ActionSet.clicks_postgame_dialogs()
		Check.check_re()
	elseif States.current_state == States.RE then
		ActionSet.clicks_re_dialogs()
		Check.check_insufficient_stamina()
		Check.check_in_battle()
	elseif States.current_state == States.INSUFFICIENT_STAMINA then
		click(Coordinates.LocationFillStaminaHoney)
		Check.check_fill_stamina()
	elseif States.current_state == States.FILL_STAMINA then
		ActionSet.fill_stamina()
		wait(Configs.FillAfterCheckWaitSeconds)
		Check.check_in_battle()
	elseif States.current_state == States.UNKNOWN then
		Check.check_current_state(function() end)
	end

	System.generate_toast()
end
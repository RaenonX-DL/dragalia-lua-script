Settings:setCompareDimension(true, Configs.DimensionWidth)
Settings:setScriptDimension(true, Configs.DimensionWidth)

------- MAIN -------
Logger.write_header()

while true do
    if States.current_state == States.COMMON_SCREEN then
        if CustomActions.click_quest_banner() then
            for _ = 1, Configs.DifficultyChecks do
                if Check.check_difficulty_screen() then
                    break
                end
                wait(Configs.DifficultyCheckWaitSeconds)
            end
        end
    elseif States.current_state == States.DIFFICULTY then
        click(Coordinates.LocationDifficultyTop)
        Check.check_room_select()
    elseif States.current_state == States.ROOM_SELECT then
        click(Coordinates.LocationRandomRoom)
        Check.check_room_finding()
        Check.check_in_room()
        Check.check_insufficient_wings()
        Check.check_loading()
    elseif States.current_state == States.FINDING_ROOM then
        Check.check_in_room()
        click(Coordinates.LocationRandomRoom)
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
            Check.check_in_room()
            Check.check_loading()
            Check.check_battle_begin()
            if ActionSet.handle_connection_errors(function()
            end) then
                Check.check_post_game()
            end
        end
    elseif States.current_state == States.LOADING then
        System.activate_loading_destucker()
        ActionSet.handle_connection_errors(function()
        end)

        if Check.check_battle_begin() or System.check_destucker_overtime() then
            System.deactivate_loading_destucker()
        end
    elseif States.current_state == States.BATTLE_START then
        CustomActions.battle_begin_actions()
        States.update_state(States.IN_BATTLE)
    elseif States.current_state == States.IN_BATTLE then
        RunsCounter.counter_ready()
        ActionSet.click_common()
        if not Check.check_dead() then
            Check.check_in_battle()
            Check.check_end_game()
            Check.dismiss_end_battle_mid_dialog()
            ActionSet.handle_connection_errors(function()
            end)
        end
    elseif States.current_state == States.BATTLE_DEAD then
        Check.check_end_game()
        doubleClick(Coordinates.LocationCloseMiddleDialog)
        Check.check_post_game()
        Check.check_difficulty_screen()
    elseif States.current_state == States.END then
        RunsCounter.count_once()

        ActionSet.clicks_postgame_dialogs()
        wait(Configs.PostgameClickCheckWaitSeconds)
        Check.check_post_game()
    else
        Check.check_current_state(function()
        end)
        System.count_analyze_state()
    end

    System.generate_toast()
end
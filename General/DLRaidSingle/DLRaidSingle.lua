Settings:setCompareDimension(true, Configs.CompareDimensionWidth)
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
        wait(1.5)
        Check.check_room_select()
    elseif States.current_state == States.ROOM_SELECT then
        click(Coordinates.LocationRandomRoom)
        wait(1.5)
        States.update_state(States.ID_LOCATION_SELECT)
    elseif States.current_state == States.ID_LOCATION_SELECT then
        click(Coordinates.LocationIdSelect)
        wait(1.5)
        Check.check_in_room()
        Check.check_insufficient_wings()
    elseif States.current_state == States.IN_ROOM then
        click(Coordinates.LocationQuestStart)
        click(Coordinates.LocationQuestStartDialog)
        ActionSet.handle_connection_errors(function()
        end)
        Check.check_battle_begin()
    elseif States.current_state == States.INSUFFICIENT_WINGS then
        ActionSet.clicks_insufficient_wings()
        Check.check_in_room()
    elseif States.current_state == States.BATTLE_START then
        CustomActions.battle_begin_actions()
        States.update_state(States.IN_BATTLE)
    elseif States.current_state == States.IN_BATTLE then
        RunsCounter.counter_ready()
        if Configs.AutoBattle then
            if not Check.check_dead() then
                if not Check.check_in_battle() then
                    ActionSet.click_common3()
                end

                if not Check.check_end_game() then
                    ActionSet.click_common3()
                    ActionSet.use_skills()
                end

                if not Check.dismiss_end_battle_mid_dialog() then
                    ActionSet.click_common3()
                    ActionSet.use_skills()
                end

                if not Check.check_post_game() then
                    ActionSet.click_common3()
                    ActionSet.use_skills()
                end

                ActionSet.handle_connection_errors(function()
                end)
            end
        else
            Check.check_post_game()
            Check.dismiss_end_battle_mid_dialog()
            Check.check_end_game()
            ActionSet.handle_connection_errors(function()
            end)
        end

        Check.check_center_close_dialog()
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
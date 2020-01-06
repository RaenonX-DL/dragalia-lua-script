local m = {}

begin_t = Timer()

-- Update Stop Message

local function update_stop_message()
    if RunsCounter ~= nil and RunsCounter.counter_runs ~= nil then
		t = begin_t:check()
		avg = t / RunsCounter.counter_runs

        setStopMessage(
                string.format(
                        "BOOOOOOOOOM!\nAngeldust-only!\n\nElapsed Time: %.3f s\nRuns: %d\nAverage %.3f s / Run\n\nState: %s\nPrevious State: %s",
                        t, RunsCounter.counter_runs, avg, States.current_state, States.previous_state))
    else
        setStopMessage(
                string.format("Elapsed Time: %.3f s \nState: %s\nPrevious State: %s",
                        begin_t:check(), States.current_state, States.previous_state))
    end
end

-- Terminate

local function terminate(message)
    vibrate(0.5)

    update_stop_message()
    scriptExit(message)
end

-- Generate Toast

last_toast = Timer()
local function generate_toast()
    update_stop_message()
    if Configs.ToastEnable and last_toast:check() > Configs.ToastCooldownSeconds then
        if RunsCounter ~= nil and RunsCounter.counter_runs ~= nil then
			t = begin_t:check()
			avg = t / RunsCounter.counter_runs

        	toast(string.format("%.3f s @ %s (%d, %.3f)", t, States.current_state, RunsCounter.counter_runs, avg))
        else
        	toast(string.format("%.3f s @ %s", begin_t:check(), States.current_state))
        end

        last_toast:set()
    end
end

m.update_stop_message = update_stop_message
m.terminate = terminate
m.generate_toast = generate_toast
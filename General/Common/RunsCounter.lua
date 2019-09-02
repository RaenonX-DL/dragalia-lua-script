local m = {}

m.ready = false
m.counter_runs = 0

local function counter_ready()
	m.ready = true
end

local function count_once()
	if m.ready then
		m.counter_runs = m.counter_runs + 1
		Logger.write_log(string.format("Battle #%d was completed at %s\n", m.counter_runs, os.date("%c")))
		m.ready = false
	end
end

m.count_once = count_once
m.counter_ready = counter_ready
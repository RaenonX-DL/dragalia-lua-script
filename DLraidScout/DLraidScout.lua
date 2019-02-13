PHONE_RESOLUTION = "WQHD" -- WQHD / FHD+

_clickIntervalSeconds = 0.5

if PHONE_RESOLUTION == "WQHD" then
	_LocationScout = Location(1149, 1764)
	_LocationNext = Location(896, 2624)
	_LocationResetClose = Location(738, 1838)
elseif PHONE_RESOLUTION == "FHD+" then
	_LocationScout = Location(951, 1344)
	_LocationNext = Location(661, 1920)
	_LocationResetClose = nil
else
	exitScript(string.format("Unknown Phone Resolution. Should be WQHD or FHD+. (%s)", PHONE_RESOLUTION))
end

while true do
	click(_LocationScout)
	wait(_clickIntervalSeconds)
	click(_LocationResetClose)
	wait(_clickIntervalSeconds)
	click(_LocationNext)
	wait(_clickIntervalSeconds)
end
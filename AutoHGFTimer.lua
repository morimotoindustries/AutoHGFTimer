script_name("AutoHGFTimer")
script_description("Automatically alerts you when it's safe to heal.")
script_version_number("1")
script_version("1.0.1")
script_author("Masaharu Morimoto")

require "moonloader"
require "sampfuncs"

-- START inicfg section - to use ini files
local inicfg = require "inicfg"

dir = getWorkingDirectory() .. "\\config\\Masaharu's Config\\"
dir2 = getWorkingDirectory() .. "\\config\\"
config = dir .. "AutoHGFTimer.ini"

-- check if the config folder and ini file exists, if not, create them and save
if not doesDirectoryExist(dir2) then createDirectory(dir2) end
if not doesDirectoryExist(dir) then createDirectory(dir) end
if not doesFileExist(config) then
	file = io.open(config, "w")
	file:write(" ")
	file:close()
	local directIni = config
	local mainIni = inicfg.load(inicfg.load({
		Options = {
			isScriptEnabled = true,
			safeSecondsFromNow = 11,
		},
	}, directIni))

	inicfg.save(mainIni, directIni)
end

local directIni = config
local mainIni = inicfg.load(nil, directIni)
inicfg.save(mainIni, directIni)
-- END inicfg section

amIHit = false

function main()
	while not isSampAvailable() do wait(100) end -- wait until samp is available and register commands
	sampAddChatMessage("{118C4F}| AutoHGFTimer | {FFC100}Author: {4285F4}Masaharu Morimoto | {FFFFFF}[{FFC100}/ahthelp{FFFFFF}]", 0xFFC100)
	sampAddChatMessage("{118C4F}| AutoHGFTimer | {FFFFFF}- {FF3333}Timer length Set to: {FFFFFF}" .. mainIni.Options.safeSecondsFromNow .. " seconds.", 0xFFC100)

	sampRegisterChatCommand("aht", cmdScriptToggle)
	sampRegisterChatCommand("ahthelp", cmdHelp)
	sampRegisterChatCommand("ahtmini", cmdMiniHelp)
	sampRegisterChatCommand("ahtchange", cmdTimerChange)
	while true do -- begin main loop
		wait(0)

  	if hasCharBeenDamagedByWeapon(PLAYER_PED, 22) or hasCharBeenDamagedByWeapon(PLAYER_PED, 23) or hasCharBeenDamagedByWeapon(PLAYER_PED, 24) or hasCharBeenDamagedByWeapon(PLAYER_PED, 25) or hasCharBeenDamagedByWeapon(PLAYER_PED, 27) or hasCharBeenDamagedByWeapon(PLAYER_PED, 28) or hasCharBeenDamagedByWeapon(PLAYER_PED, 29) or hasCharBeenDamagedByWeapon(PLAYER_PED, 30) or hasCharBeenDamagedByWeapon(PLAYER_PED, 31) or hasCharBeenDamagedByWeapon(PLAYER_PED, 32) or hasCharBeenDamagedByWeapon(PLAYER_PED, 33) or hasCharBeenDamagedByWeapon(PLAYER_PED, 34) or isCharShooting(PLAYER_PED) and mainIni.Options.isScriptEnabled then -- check if player has been damaged by a gun or if they are shooting as well as ensure the scipt is enabled
			if not amIHit then
				lastHitTime = os.time()
				print("You're in a gunfight!")
				safeSecondsFromNow = lastHitTime + mainIni.Options.safeSecondsFromNow
			else
				lastHitTime = os.time()
				print("You're in a gunfight!")
				safeSecondsFromNow = lastHitTime + mainIni.Options.safeSecondsFromNow
				clearCharLastWeaponDamage(PLAYER_PED)
			end
			amIHit = true
		end

		currentTime = os.time()

		if currentTime == safeSecondsFromNow and amIHit and not noMessage then
			amIHit = false
			sampAddChatMessage("{118C4F}| AutoHGFTimer | {FFFFFF}- {22FF22}|---------- SAFE To Heal! ----------|", 0xFFC100)
			noMessage = false
		end

	end
end

function cmdScriptToggle()
	if mainIni.Options.isScriptEnabled then
		mainIni.Options.isScriptEnabled = false
		sampAddChatMessage("{118C4F}| AutoHGFTimer | {FFFFFF}- {FF2222}Disabled", 0xFFC100)
		inicfg.save(mainIni, directIni)
	else
		mainIni.Options.isScriptEnabled = true
		sampAddChatMessage("{118C4F}| AutoHGFTimer | {FFFFFF}- {22FF22}Enabled", 0xFFC100)
		inicfg.save(mainIni, directIni)
	end
end

function cmdTimerChange(newTimer)
	if newTimer == nil or newTimer == "" or not isInteger(newTimer) then
		sampAddChatMessage("{118C4F}| AutoHGFTimer | {FFFFFF}- {FF3333}Timer length must be an integer and not empty", 0xFFC100)
	else
		newTimerNum = tonumber(newTimer)
		if newTimerNum >= 21 or newTimerNum <= 9 then
			sampAddChatMessage("{118C4F}| AutoHGFTimer | {FFFFFF}- {FF3333}Timer length must be between 10 and 20 seconds", 0xFFC100)
		else
			mainIni.Options.safeSecondsFromNow = newTimerNum
			sampAddChatMessage("{118C4F}| AutoHGFTimer | {FFFFFF}- {FF3333}Timer length Set to: {FFFFFF}" .. tostring(newTimerNum) .. " seconds.", 0xFFC100)
			inicfg.save(mainIni, directIni)
		end
	end
end

function isInteger(str)
  return not (str == "" or str:find("%D"))
end

function cmdHelp()
	sampAddChatMessage("{FFFFFF}|-------------{118C4F} | AutoHGFTimer | {FFFFFF}from {4285F4}MORIMOTO Industries {FFFFFF}-------------|", 0xFFC100)
	sampAddChatMessage("{FFC100}- Commands:", 0xFFC100)
	sampAddChatMessage("{118C4F}/aht {FFFFFF}- Enable/Disable {118C4F}| AutoHGFTimer |", 0xFFC100)
	sampAddChatMessage("{118C4F}/ahthelp {FFFFFF}- Show the help menu.", 0xFFC100)
	sampAddChatMessage("{118C4F}/ahpmini {FFFFFF}- Show the mini help menu.", 0xFFC100)
	sampAddChatMessage("{118C4F}/ahtchange {FFFFFF}- Set the length after a gunfight. E.g. [/ahpchange 11]", 0xFFC100)
	sampAddChatMessage(" ", 0xFFC100)
	sampAddChatMessage("{FFC100}- Description:", 0xFFC100)
	sampAddChatMessage("{FFFFFF}This script will automatically alert you when it is safe to heal", 0xFFC100)
	sampAddChatMessage("{FFFFFF}after a gunfight. Currently Set To: {FF4444}" .. mainIni.Options.safeSecondsFromNow .. "{FFFFFF} seconds.", 0xFFC100)
	sampAddChatMessage(" ", 0xFFC100)
	sampAddChatMessage("{FFC100}- Author:", 0xFFC100)
	sampAddChatMessage("{FFFFFF}Masaharu Morimoto#2302", 0xFFC100)
	sampAddChatMessage("{FFFFFF}|-------------{118C4F} | AutoHGFTimer | {FFFFFF}from {4285F4}MORIMOTO Industries {FFFFFF}-------------|", 0xFFC100)
end

function cmdMiniHelp()
	sampAddChatMessage("{FFFFFF}|-------------{118C4F} | AutoHGFTimer | {FFFFFF}from {4285F4}MORIMOTO Industries {FFFFFF}-------------|", 0xFFC100)
	sampAddChatMessage("{118C4F}/aht {FFFFFF}- Enable/Disable {118C4F}| AutoHGFTimer |", 0xFFC100)
	sampAddChatMessage("{118C4F}/ahthelp {FFFFFF}- Show the help menu.", 0xFFC100)
	sampAddChatMessage("{118C4F}/ahpmini {FFFFFF}- Show the mini help menu.", 0xFFC100)
	sampAddChatMessage("{118C4F}/ahtchange {FFFFFF}- Set the length after a gunfight. E.g. [/ahpchange 11]", 0xFFC100)
end

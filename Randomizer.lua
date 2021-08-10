gui.addmessage("Star Fox 64: Randomizer is Active! Progam made by: Livvydoodlez")
--Configuration settings


--Enables training mode in RNG
enable_impossible_planets = 0

--Enables ending stages like bolse, venom, and area 6 in the RNG table
enable_ending_stages = 0

--Enables a long venom route [NOT WORKING BETA 4]
enable_long_venom = 0

--Enables randomized Expert Mode
enable_expert_mode = 0

--enable randomization at start before corneria
enable_early_randomization = 0

--randomizes the planets to allow you to go back to levels you already completed
enable_repeatable_levels = 0

--Adds star wolf to Katina
enable_star_wolf_katina = 0






--Variable settings, do not change
local debugMode = 1

--Stage IDs
local pCor = 0
local pMet = 1
local pSeX = 2
local pAr6 = 3
local pSeY = 5
local pVe1 = 6
local pSol = 7
local pZon = 8
local pV1T = 9
local pTra = 10
local pMac = 11
local pTit = 12
local pAqu = 13
local pFor = 14
local pKat = 16
local pBol = 17
local pSeZ = 18
local pVe2 = 19

--Solar System Information
local pCount = 0
local oldStage = 0
local oldLives = 0
local planetList = {pCor, pMet, pSeX, pSeY, pSol, pZon, pMac, pTit, pAqu, pFor, pKat, pSeZ, pTra}
local allPlanets = {pCor, pMet, pSeX, pSeY, pSol, pZon, pMac, pTit, pAqu, pFor, pKat, pSeZ, pAr6, pBol, pTra}
local aPlanets = {pCor, pMet, pSeX, pSeY, pSol, pZon, pMac, pTit, pAqu, pFor, pKat, pSeZ, pTra}
local ePlanets = {pBol, pAr6}
local obtainNew = 0
local checkLives = 0
local nextPlanet = 0
local sfcheck = 0
local swKatinaT = 0

--player information
local playerLives = 0
local playerStage = 0
local playerState1 = 0
local playerState2 = 0
local playerMode = 0
local restarted = 0

--portrait info

local currentPortrait = 0
local peppy = 16880
local fox = 0
local james = 17352
local slippy = 16800
local falco = 16672
local rob = 17076
local redP = 17327
local corBoss1 = 17116
local corBoss2 = 17056
local seyBoss = 17184
local metBoss = 17096
local sexBoss = 17174
local zonBoss = 17154
local andross = 16988
local subBoss1 = 17204
local subBoss2 = 17136
local macBoss = 16928
local bill = 17194
local katt = 16928
local wolf = 17224
local leon = 17244
local pigma = 17234
local andrew = 17254
local vWolf = 17264
local vLeon = 17282
local vPigma = 17274
local vAndrew = 17287
local speaking = 0
local portraitChange = 0
local orP = 0
local lastSpeaker = 0
local expertModeToggle = 0
local randomMusic = 0


--New Portraits
local oPeppy = 0
local oFox = 0
local oJames = 0
local oSlippy = 0
local oFalco = 0
local oRob = 0
local oRedP = 0
local oCorBoss1 = 0
local oCorBoss2 = 0
local oSeyBoss = 0
local oMetBoss = 0
local oSexBoss = 0
local oZonBoss = 0
local oAndross = 0
local oSubBoss1 = 0
local oSubBoss2 = 0
local oMacBoss = 0
local oBill = 0
local oKatt = 0
local oWolf = 0
local oLeon = 0
local oPigma = 0
local oAndrew = 0
local oVWolf = 0
local oVLeon = 0
local oVPigma = 0
local oVAndrew = 0
local pChange = 0


local newCorneria = 0
local newMeteo = 0
local newFortuna = 0
local newKatina = 0
local newSx = 0
local newTitania = 0
local newBolse = 0
local newV1 = 0
local newSy = 0
local newSolar = 0
local newAquas = 0
local newZoness = 0
local newMacbeth = 0
local newA6 = 0
local newSz = 0
local newV2 = 0
local newTunnel = 0

--Misc Information
local vcorneria = {16880, 0, 16800, 16672, 17076, 17352, 17116, 17056}
local vmeteo = {16880, 0, 16800, 16672, 17076, 17352, 17096}
local vfortuna = {16880, 0, 16800, 16672, 17076, 17352, 17224, 17244, 17234, 17254}
local vkatina = {16880, 0, 16800, 16672, 17076, 17352, 17194, 16928, 17264, 17282, 17274, 17287}
local vsx = {16880, 0, 16800, 16672, 17076, 17352, 17194, 17174}
local vtitania = {16880, 0, 16800, 16672, 17076, 17352}
local vbolse = {16880, 0, 16800, 16672, 17076, 17352, 17224, 17244, 17234, 17254}
local vv1 = {16880, 0, 16800, 16672, 17076, 17352, 16988}
local vsy = {16880, 0, 16800, 16672, 17076, 17352, 17184}
local vsolar = {16880, 0, 16800, 16672, 17076, 17352, 17174}
local vaquas = {16880, 0, 16800, 16672, 17076, 17352}
local vzoness = {16880, 0, 16800, 16672, 17076, 17352, 16928, 17154}
local vmacbeth = {16880, 0, 16800, 16672, 17076, 17352, 17214, 16928}
local va6 = {16880, 0, 16800, 16672, 17076, 17352, 16988, 17204, 17136}
local vsz = {16880, 0, 16800, 16672, 17076, 17352, 16928}
local vv2 = {16880, 0, 16800, 16672, 17076, 17352, 17264, 17282, 17274, 17287}
local vtraining = {17076, 17327}
local vtunnel = {0, 17352, 16988}
local soundID = tonumber(memory.read_s16_be(0x0C2F06, "RDRAM"))
local mapStatus = 0
local ePowerUps = {322, 322, 322, 322, 322, 322, 324, 324, 324, 324, 324, 324, 325, 325, 325, 325, 325, 325, 327, 327, 327, 327, 327, 327, 335, 336, 336, 336, 336, 336, 336, 337, 337, 337, 337, 337, 337}
local expertMode = {0, 1}
local music = {65,60,58,43,36,34,19,18,14,12,11,10,9,8,7,6,5,4,3,2}
--bill: 55
--katt 54
--cor opening demo 50
--cor opening demo 
local randomSong = 0
local randomPort = 0
local tickedMain = 0



--Randomize object's position inside of a list
local function shuffle(tbl)
  for i = #tbl, 2, -1 do
    local j = math.random(i)
    tbl[i], tbl[j] = tbl[j], tbl[i]
  end
  return tbl
end

--remove an object from a list without breaking a list
local function removeFromList(array, value)
	for i = #array, 1, -1 do
		if array[i] == value then
			table.remove(array, i)
		end
	end
end

--get size of a list
local function listSize(array)
        listSize = 0
        for _ in pairs(array) do 
            listSize = listSize + 1
        end
    return listSize
end



--Prepare portrait randomization
local function prepareRandom()
     newCorneria = shuffle(vcorneria)
     newMeteo = shuffle(vmeteo)
     newFortuna = shuffle(vfortuna)
     newKatina = shuffle(vkatina)
     newSx = shuffle(vsx)
     newTitania = shuffle(vtitania)
     newBolse = shuffle(vbolse)
     newV1 = shuffle(vv1)
     newSy = shuffle(vsy)
     newSolar = shuffle(vsolar)
     newAquas = shuffle(vaquas)
     newZoness = shuffle(vzoness)
     newMacbeth = shuffle(vmacbeth)
     newA6 = shuffle(va6)
     newSz = shuffle(vsz)
     newV2 = shuffle(vv2)
     newTunnel = shuffle(vtunnel)
    
end

prepareRandom()


function randomPickUp()
    randomEPickup = tonumber(ePowerUps[math.random(#ePowerUps)])
    memory.write_s32_be(0x0CB408, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB40C, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB410, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB414, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB418, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB41C, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB420, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB424, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB428, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB42C, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB430, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB434, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB438, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB43C, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB440, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB444, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB448, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB44C, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB450, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB454, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB458, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB45C, randomEPickup, "RDRAM")
    memory.write_s32_be(0x0CB460, randomEPickup, "RDRAM")
end


function swKatina()
    if playerStage == pKat then
        if enable_star_wolf_katina == 1 then
            enable_star_wolf_katina = 0
            memory.write_s16_be(0x02BD30, 3072, "RDRAM")
            memory.write_s16_be(0x02BD32, 43996, "RDRAM")
            emu.frameadvance()
            gui.addmessage("ADDING STAR WOLF")
            swKatinaT = 1
        end
    end
end


function corneria()
    oFox = newCorneria[1]
    oPeppy = newCorneria[2]
    oSlippy = newCorneria[3]
    oFalco = newCorneria[4]
    oJames = newCorneria[5]
    oRob = newCorneria[6]
    oCorBoss1 = newCorneria[7]
    oCorBoss2 = newCorneria[8]
end



function meteo()
    oFox = newMeteo[1]
    oPeppy = newMeteo[2]
    oSlippy = newMeteo[3]
    oFalco = newMeteo[4]
    oJames = newMeteo[5]
    oRob = newMeteo[6]
    oMetBoss = newMeteo[7]
end



function fortuna()
    oFox = newFortuna[1]
    oPeppy = newFortuna[2]
    oSlippy = newFortuna[3]
    oFalco = newFortuna[4]
    oJames = newFortuna[5]
    oRob = newFortuna[6]
    oWolf = newFortuna[7]
    oLeon = newFortuna[8]
    oPigma = newFortuna[9]
    oAndrew = newFortuna[10]
end



function katina()
    oFox = newKatina[1]
    oPeppy = newKatina[2]
    oSlippy = newKatina[3]
    oFalco = newKatina[4]
    oJames = newKatina[5]
    oRob = newKatina[6]
    oBill = newKatina[7]
end



function sx()
    oFox = newSx[1]
    oPeppy = newSx[2]
    oSlippy = newSx[3]
    oFalco = newSx[4]
    oJames = newSx[5]
    oRob = newSx[6]
    oSexBoss = newSx[7]
end



function titania()
    oFox = newTitania[1]
    oPeppy = newTitania[2]
    oSlippy = newTitania[3]
    oFalco = newTitania[4]
    oJames = newTitania[5]
    oRob = newTitania[6]
end



function bolse()
    oFox = newBolse[1]
    oPeppy = newBolse[2]
    oSlippy = newBolse[3]
    oFalco = newBolse[4]
    oJames = newBolse[5]
    oWolf = newBolse[6]
    oLeon = newBolse[7]
    oPigma = newBolse[8]
    oAndrew = newBolse[9]
end



function v1()
    oFox = newV1[1]
    oPeppy = newV1[2]
    oSlippy = newV1[3]
    oFalco = newV1[4]
    oJames = newV1[5]
    oRob = newV1[6]
    oAndross = newv1[7]
end



function sy()
    oFox = newSy[1]
    oPeppy = newSy[2]
    oSlippy = newSy[3]
    oFalco = newSy[4]
    oJames = newSy[5]
    oRob = newSy[6]
    oSeyBoss = newSy[7]
end



function solar()
    oFox = newSolar[1]
    oPeppy = newSolar[2]
    oSlippy = newSolar[3]
    oFalco = newSolar[4]
    oJames = newSolar[5]
    oRob = newSolar[6]
    oBill = newSolar[7]
end



function aquas()
    oFox = newAquas[1]
    oPeppy = newAquas[2]
    oSlippy = newAquas[3]
    oFalco = newAquas[4]
    oJames = newAquas[5]
    oRob = newAquas[6]
end



function zoness()
    oFox = newZoness[1]
    oPeppy = newZoness[2]
    oSlippy = newZoness[3]
    oFalco = newZoness[4]
    oJames = newZoness[5]
    oRob = newZoness[6]
    oKatt = newZoness[7]
    oZonBoss = newZoness[8]
end



function macbeth()
    oFox = newMacbeth[1]
    oPeppy = newMacbeth[2]
    oSlippy = newMacbeth[3]
    oFalco = newMacbeth[4]
    oJames = newMacbeth[5]
    oRob = newMacbeth[6]
    oKatt = newMacbeth[7]
    oMacBoss = newMacbeth[8]
end



function a6()
    oFox = newA6[1]
    oPeppy = newA6[2]
    oSlippy = newA6[3]
    oFalco = newA6[4]
    oJames = newA6[5]
    oRob = newA6[6]
    oSubBoss1 = newA6[7]
    oSubBoss2 = newA6[8]
    oAndross = newA6[9]
end




function sz()
    oFox = newSZ[1]
    oPeppy = newSZ[2]
    oSlippy = newSZ[3]
    oFalco = newSZ[4]
    oJames = newSZ[5]
    oRob = newSZ[6]
    oKatt = newSZ[7]
end



function v2()
    oFox = newV2[1]
    oPeppy = newV2[2]
    oSlippy = newV2[3]
    oFalco = newV2[4]
    oJames = newV2[5]
    oRob = newV2[6]
    oVWolf = newV2[7]
    oVLeon = newV2[8]
    oVPigma = newV2[9]
    oVAndrew = newV2[10]
end



function tunnel()
    oFox = newV2[1]
    oJames = newV2[2]
    oAndross = newV2[3]
end




--Advance a frame
function adv()
    emu.frameadvance()
end




--Get a random planet

function getPlanet()
    pCount = pCount + 1
    if pCount < 5 then
        if enable_repeatable_levels == 0 then
            removeFromList(aPlanets, oldStage)
        end
        if enable_ending_stages == 1 then
            randomPlanet = tonumber(allPlanets[math.random(#allPlanets)])
        else
            randomPlanet = tonumber(aPlanets[math.random(#aPlanets)])
        end
        if randomPlanet == oldStage then
            if enable_ending_stages == 1 then
                randomPlanet = tonumber(allPlanets[math.random(#allPlanets)])
            else
                randomPlanet = tonumber(aPlanets[math.random(#aPlanets)])
            end
        end
    end
    if pCount >= 5 then
        randomPlanet = tonumber(ePlanets[math.random(#ePlanets)])
    end
    nextPlanet = randomPlanet
end



--Player Infromation

function getInfo()
    playerLives = tonumber(memory.readbyte(0x157911, "RDRAM"))
    playerStage = tonumber(memory.readbyte(0x16E0A7, "RDRAM"))
    playerState1 = tonumber(memory.readbyte(0x137BAB, "RDRAM"))
    playerState2 = tonumber(memory.readbyte(0x13AA8B, "RDRAM"))
    playerMode = tonumber(memory.read_s32_be(0x16D868, "RDRAM"))
    mapStatus = tonumber(memory.read_s32_be(0x1C37B4, "RDRAM"))
    checkPortrait = tonumber(memory.read_s16_be(0x16DBD8, "RDRAM"))
    mainMenu = tonumber(memory.read_s32_be(0x16D6A4, "RDRAM"))
    checkSpeak = tonumber(memory.readbyte(0x16DBC0, "RDRAM"))
    soundID = tonumber(memory.read_s16_be(0x0C2F06, "RDRAM"))
    systemBoot = tonumber(memory.read_s32_be(0x16DC20, "RDRAM"))
end



function assignNew()
    if portraitChange == 1 then
        portraitChange = 0
        if playerStage == pCor then
            corneria()
        end
        if playerStage == pMet then
            meteo()
        end
        if playerStage == pFor then
            fortuna()
        end
        if playerStage == pKat then
            katina()
        end
        if playerStage == pSeX then
            sx()
        end
        if playerStage == pTit then
            titania()
        end
        if playerStage == pBol then
            bolse()
        end
        if playerStage == pVe1 then
            v1()
        end
        if playerStage == pSeY then
            sy()
        end
        if playerStage == pSol then
            solar()
        end
        if playerStage == pAqu then
            aquas()
        end
        if playerStage == pZon then
            zoness()
        end
        if playerStage == pMac then
            macbeth()
        end
        if playerStage == pAr6 then
            a6()
        end
        if playerStage == pSeZ then
            sz()
        end
        if playerStage == pVe2 then
            v2()
        end
        if playerStage == pTun then
            tunnel()
        end
    end
end


function lastspeaking()
    if lastSpeaker ~= checkPortrait then
        lastSpeaker = checkPortrait
    end
end





function randomPortraits()
        corneria = {16880, 0, 16800, 16672, 17076, 17352, 17116, 17056}
        meteo = {16880, 0, 16800, 16672, 17076, 17352, 17096}
        fortuna = {16880, 0, 16800, 16672, 17076, 17352, 17224, 17244, 17234, 17254}
        katina = {16880, 0, 16800, 16672, 17076, 17352, 17194, 16928, 17264, 17282, 17274, 17287}
        sx = {16880, 0, 16800, 16672, 17076, 17352, 17194, 17174}
        titania = {16880, 0, 16800, 16672, 17076, 17352}
        bolse = {16880, 0, 16800, 16672, 17076, 17352, 17224, 17244, 17234, 17254}
        v1 = {16880, 0, 16800, 16672, 17076, 17352, 16988}
        sy = {16880, 0, 16800, 16672, 17076, 17352, 17184}
        solar = {16880, 0, 16800, 16672, 17076, 17352, 17174}
        aquas = {16880, 0, 16800, 16672, 17076, 17352}
        zoness = {16880, 0, 16800, 16672, 17076, 17352, 16928, 17154}
        macbeth = {16880, 0, 16800, 16672, 17076, 17352, 17214, 16928}
        a6 = {16880, 0, 16800, 16672, 17076, 17352, 16988, 17204, 17136}
        sz = {16880, 0, 16800, 16672, 17076, 17352, 16928}
        v2 = {16880, 0, 16800, 16672, 17076, 17352, 17264, 17282, 17274, 17287}
        tunnel = {0, 17352, 16988}
        if playerStage == pCor then
            randomPortrait = tonumber(corneria[math.random(#corneria)])
        elseif playerStage == pMet then
            randomPortrait = tonumber(meteo[math.random(#meteo)])
        elseif playerStage == pAr6 then
            randomPortrait = tonumber(a6[math.random(#a6)])
        elseif playerStage == pSey then
            randomPortrait = tonumber(sy[math.random(#sy)])
        elseif playerStage == pVe1 then
            randomPortrait = tonumber(v1[math.random(#v1)])
        elseif playerStage == pSol then
            randomPortrait = tonumber(solar[math.random(#solar)])
        elseif playerStage == pZon then
            randomPortrait = tonumber(zoness[math.random(#zoness)])
        elseif playerStage == pV1T then
            randomPortrait = tonumber(tunnel[math.random(#tunnel)])
        elseif playerStage == pMac then
            randomPortrait = tonumber(macbeth[math.random(#macbeth)])
        elseif playerStage == pTit then
            randomPortrait = tonumber(titania[math.random(#titania)])
        elseif playerStage == pAqu then
            randomPortrait = tonumber(aquas[math.random(#aquas)])
        elseif playerStage == pFor then
            randomPortrait = tonumber(fortuna[math.random(#fortuna)])
        elseif playerStage == pKat then
            randomPortrait = tonumber(katina[math.random(#katina)])
        elseif playerStage == pBol then
            randomPortrait = tonumber(bolse[math.random(#bolse)])
        elseif playerStage == pSeZ then
            randomPortrait = tonumber(sz[math.random(#sz)])
        elseif playerStage == pVe2 then
            randomPortrait = tonumber(v2[math.random(#v2)])
        else
            randomPortrait = tonumber(corneria[math.random(#corneria)])
        end
end









--Who is currently speaking


function speaker()
    spoke = 0
    if portraitChange == 1 then
        assignNew()
        portraitChange = 0
        speaking = 1
    end
    if checkPortrait == fox and speaking == 1 and spoke == 0 then
        speaking = "FOX"
        memory.write_s16_be(0x16DBD8, oFox, "RDRAM")
        speaking = 0
        spoke = 1
    elseif checkPortrait == peppy and speaking == 1 and spoke == 0 then
        speaking = "PEPPY"
        memory.write_s16_be(0x16DBD8, oPeppy, "RDRAM")
        speaking = 0
        spoke = 1
    elseif checkPortrait == slippy and speaking == 1 and spoke == 0 then
        speaking = "SLIPPY"
        memory.write_s16_be(0x16DBD8, oSlippy, "RDRAM")
        speaking = 0
        spoke = 1
    elseif checkPortrait == falco and speaking == 1 and spoke == 0 then
        speaking = "FALCO"
        memory.write_s16_be(0x16DBD8, oFalco, "RDRAM")
        speaking = 0
        spoke = 1
    end
    spoke = 0
    speaking = 1
end



function debugInfo()
    if debugMode == 1 then
        gui.text(0,0, "SF64:RAND. DEBUG INFORMATION:")
        gui.text(0,10,"-----------------------------")
        
        
        gui.text(0,30,"Game Information:")
        gui.text(0,40,"-----------------")
        gui.text(0,50,"Planets Completed: " ..pCount)
        gui.text(0,70,"Last Stage Completed: " ..oldStage)
        gui.text(0,90,"Next Planet Selected: " ..nextPlanet)
        gui.text(0,110,"Current Planet Level: " ..playerStage)
        gui.text(0,130,"Randomizing Planet: " ..obtainNew)
        gui.text(0,150,"Map Status: " ..mapStatus)
        
        gui.text(0,200,"Player Information:")
        gui.text(0,210,"------------------")
        gui.text(0,220,"Current Lives: " ..playerLives)
        gui.text(0,240,"Old Lives: " ..oldLives)
        gui.text(0,260,"Checking Lives:" ..checkLives)
        
        apSize = 0
        spacing = 300
        
        gui.text(0,300,"Planet List:")
        gui.text(0,310,"------------")
        if enable_ending_stages == 0 then
            for _ in pairs(aPlanets) do 
                apSize = apSize + 1
                spacing = spacing + 20
                inList = tonumber(aPlanets[apSize])
                gui.text(0,spacing, inList)
            end
        else
            for _ in pairs(allPlanets) do 
                apSize = apSize + 1
                spacing = spacing + 20
                inList = tonumber(allPlanets[apSize])
                gui.text(0,spacing, inList)
            end
        end
        
        gui.text(0,620,"Speaking: ")
        gui.text(0,630,"--------")
        gui.text(0,640,"Portrait ID: " ..checkPortrait)
        
        
        apSize = 0
        spacing = 730
        
        gui.text(0,730,"R. Corneria:")
        gui.text(0,740,"------------")
        gui.text(0,760,"oFox: " ..oFox)
        gui.text(0,780,"oFalco: " ..oFalco)
        gui.text(0,800,"oPeppy: " ..oPeppy)
        gui.text(0,820,"oSlippy: " ..oSlippy)
        --[[for _ in pairs(newCorneria) do 
            apSize = apSize + 1
            spacing = spacing + 20
            inList = tonumber(newCorneria[apSize])
            gui.text(0,spacing, inList)
        end]]--
        gui.text(0,900,"Expert Mode: " ..tonumber(memory.read_s32_be(0x16D868, "RDRAM")))
        gui.text(0,920,"Song:" ..randomSong)
        gui.text(0,940,"Initate Song List:" ..tonumber(memory.read_s16_be(0x01D488, "RDRAM")))
        
    end
end

--Get ending sequence
while true do
    
    
    if enable_early_randomization == 1 then
        obtainNew = 1
        enable_early_randomization = 0
        pCount = pCount - 1
    end
    
    if enable_impossible_planets == 0 then
        
        rpSize = 0
        for _ in pairs(aPlanets) do 
            rpSize = rpSize + 1
            inList = tonumber(aPlanets[rpSize])
            if inList == pTra then
                removeFromList(aPlanets, pTra)
            end
        end
        rpSize = 0
        for _ in pairs(allPlanets) do 
            rpSize = rpSize + 1
            inList = tonumber(allPlanets[rpSize])
            if inList == pTra then
                removeFromList(allPlanets, pTra)
            end
        end
    end
    
    
    getInfo()
    debugInfo()
    adv()
    
        
    if mainMenu == 3 then
        tickedMain = 1
        randomMusic = 0
        memory.write_s16_be(0x01D488, 9226, "RDRAM")
        if randomMusic == 0 then
            memory.write_s16_be(0x01D488, 9226, "RDRAM")
            randomSong = tonumber(music[math.random(#music)])
            randomMusic = 1
            memory.write_s16_be(0x01D48A, randomSong, "RDRAM")
            memory.write_s16_be(0x01D48A, randomSong, "RDRAM")
        end
    end
    
    if tickedMain == 1 then
        if systemBoot == 0 then
            memory.write_s16_be(0x01D488, 9226, "RDRAM")
            memory.write_s16_be(0x01D48A, randomSong, "RDRAM")
        end
    end
    
    
    if playerState1 == 1 or playerState2 == 1 then
        randomMusic = 0
        memory.writebyte(0x16E0A7, nextPlanet, "RDRAM")
        
        
        if randomMusic == 0 then
            memory.write_s16_be(0x01D488, 9226, "RDRAM")
            randomSong = tonumber(music[math.random(#music)])
            randomMusic = 1
            memory.write_s16_be(0x01D48A, randomSong, "RDRAM")
            memory.write_s16_be(0x01D48A, randomSong, "RDRAM")
        end
        
        if enable_star_wolf_katina == 1 then
            swKatina()
        end
        if enable_expert_mode == 1 then
           expertModeToggle = 1 
        end
    end
    
    
    if playerState1 == 2 or playerState2 == 2 then
        memory.writebyte(0x16E0A7, nextPlanet, "RDRAM")
        
        
        if randomMusic == 0 then
            memory.write_s16_be(0x01D488, 9226, "RDRAM")
            randomSong = tonumber(music[math.random(#music)])
            randomMusic = 1
            memory.write_s16_be(0x01D48A, randomSong, "RDRAM")
            memory.write_s16_be(0x01D48A, randomSong, "RDRAM")
        end
        if pChange == 0 then
            randomPortraits()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            pChange = 1
        end
        if soundID < 2 then
            pChange = 0    
        end
    end
    
    
    if playerState1 == 3 or playerState2 == 3 then
        randomPickUp()
        if randomMusic == 0 then
            memory.write_s16_be(0x01D488, 9226, "RDRAM")
            randomSong = tonumber(music[math.random(#music)])
            randomMusic = 1
            memory.write_s16_be(0x01D48A, randomSong, "RDRAM")
            memory.write_s16_be(0x01D48A, randomSong, "RDRAM")
        end
        
        if pChange == 0 then
            randomPortraits()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            pChange = 1
        end
        if soundID < 2 then
            pChange = 0    
        end
        
        if expertModeToggle == 1 then
            expertModeToggle = 0
            getExpert = tonumber(expertMode[math.random(#expertMode)])
            memory.write_s32_be(0x16D868, getExpert, "RDRAM")
            memory.writebyte(0x16DB83, 20, "RDRAM")
	        memory.writebyte(0x16DB9B, 20, "RDRAM")
        end
        if swKatinaT == 1 then
            memory.write_s16_be(0x02BD30, 3078, "RDRAM")
            memory.write_s16_be(0x02BD32, 14593, "RDRAM")
            swKatinaT = 0
        end
        if restarted == 1 then
            pCount = pCount - 1
            restarted = 0
        end
    end
    
    if playerState1 == 22 and playerState2 == 0 or playerState2 == 6 then
        randomMusic = 0
    end
    
    
    if playerState1 == 7 then
        memory.write_s16_be(0x01D48A, randomSong, "RDRAM")
        memory.write_s16_be(0x01D48A, randomSong, "RDRAM")
        if pChange == 0 then
            randomPortraits()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            pChange = 1
        end
        --Record the old stage
        oldStage = playerStage
        if pCount < 5 then
            obtainNew = 1
        end
        checkLives = 1
    
    end
   
    if playerState2 == 7 then
        memory.write_s16_be(0x01D48A, randomSong, "RDRAM")
        memory.write_s16_be(0x01D48A, randomSong, "RDRAM")
        if pChange == 0 then
            randomPortraits()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            pChange = 1
        end
        --Record the old stage
        oldStage = playerStage
        if pCount < 5 then
            obtainNew = 1
        end
        checkLives = 1

    end
    
   
    --Collect information for the next stage

    
    if mapStatus == 3 then
        randomMusic = 0
        memory.write_s16_be(0x01D48A, randomSong, "RDRAM")
        if checkLives == 1 then
            checkLives = 0
            oldLives = playerLives
        end
        if oldLives > playerLives then
            nextPlanet = oldStage
            obtainNew = 0
            restarted = 1
        else
            if obtainNew == 1 then
                getPlanet()
                obtainNew = 0
            end
        end
    end
   
    
    -- Apply the next planet

    if mapStatus == 4 then
        randomMusic = 0
        --debugInfo()
        memory.write_s16_be(0x01D48A, randomSong, "RDRAM")
        memory.writebyte(0x16E0A7, nextPlanet, "RDRAM")
    end
end

gui.addmessage("Star Fox 64: Randomizer is Active! Progam made by: Livvydoodlez")


--Change the below from a 0 to a 1 to enable the features.



--Enables training mode in RNG
enable_impossible_planets = 0
--Enables ending stages like bolse, venom, and area 6 in the RNG table
enable_ending_stages = 0
--Enables a long venom route ( NOT IN BETA 3)
enable_long_venom = 0
--Enables randomized Expert Mode
enable_expert_mode = 0
--Enable early mothership on Katina ( NOT IN BETA 3)
enable_early_katina = 0
--enable randomization at start before corneria (NOT IN BETA 3)
enable_early_randomization = 0
























-- DO NOT CHANGE ANY SETTINGS BEYOND THIS POINT!

pCor = 0
pMet = 1
pSeX = 2
pAr6 = 3
pSeY = 5
pVe1 = 6
pSol = 7
pZon = 8
pV1T = 9
pTra = 10
pMac = 11
pTit = 12
pAqu = 13
pFor = 14
pKat = 16
pBol = 17
pSeZ = 18
pVe2 = 19

local expertMode = {0, 1}
local getExpert = 0
local setOverride = 0

if enable_expert_mode == 1 then
    getExpert = tonumber(expertMode[math.random(#expertMode)])
end

local oldStage = 0
local getNew = 0
local mapStage
oldLives = 0
endCheck = 0
setEnding = 0
debug = 0
endGame = 0
local aPlanets = {pCor, pMet, pSeX, pSeY, pSol, pZon, pMac, pTit, pAqu, pFor, pKat, pSez}

--Impossible Planets Toggle
if enable_impossible_planets == 1 then
    aPlanets = {pCor, pTra, pMet, pSeX, pSeY, pSol, pZon, pMac, pTit, pAqu, pFor, pKat, pSez}
else
    aPlanets = {pCor, pMet, pSeX, pSeY, pSol, pZon, pMac, pTit, pAqu, pFor, pKat, pSez}
end

--Ending Stages & Impossible planets toggle
if enable_ending_stages == 1 and enable_impossible_planets == 1 then
    aPlanets = {pCor, pTra, pMet, pSeX, pSeY, pSol, pZon, pMac, pTit, pAqu, pFor, pKat, pSez, pBol, pAr6, pVe1, pV1T, pVe2}
end

--Enable ending stages but disables the impossible ones
if enable_ending_stages == 1 then
    aPlanets = {pCor, pMet, pSeX, pSeY, pSol, pZon, pMac, pTit, pAqu, pFor, pKat, pSez, pBol, pAr6, pVe1, pV1T, pVe2}
    --aPlanets = {pBol, pAr6, pVe1, pVe2, pV1T}
end


local ePlanets = {pBol, pAr6}
local ePowerUps = {322, 322, 322, 322, 322, 322, 324, 324, 324, 324, 324, 324, 325, 325, 325, 325, 325, 325, 327, 327, 327, 327, 327, 327, 335, 336, 336, 336, 336, 336, 336, 337, 337, 337, 337, 337, 337}
pCount = 0
oldPCount = 0
randomPlanet = 0
newLevel = 0
debugMeteo = 0
randomEPickup = 0
randomPortrait = 0
pChange = 0
playerStage = 0
local ticked = 0


function getRandomAfterTank()
    if oldStage == pMac then
        aPlanets = {pCor, pMet, pSeX, pSeY, pSol, pZon, pTit, pAqu, pFor, pKat, pSez}
        randomPlanet = tonumber(aPlanets[math.random(#aPlanets)])
    end
    if oldStage == pTit then
        aPlanets = {pCor, pMac, pMet, pSeX, pSeY, pSol, pZon, pAqu, pFor, pKat, pSez}
        randomPlanet = tonumber(aPlanets[math.random(#aPlanets)])
    end
end

function EndTheGame()
    endGame = 1
    if pCount >= 5 then
        randomPlanet = tonumber(ePlanets[math.random(#ePlanets)])
    end
end
        


function getPlanet()
    i = 0
    getNew = 0
    ticked = 1
    gui.addmessage(oldStage)
    if oldStage == pMac and pCount < 5 then
        setOverride = 1
        aPlanets = {pCor, pMet, pSeX, pSeY, pSol, pZon, pTit, pAqu, pFor, pKat, pSez}
        randomPlanet = tonumber(aPlanets[math.random(#aPlanets)])
        forceLevel = 1
    end
    if oldStage == pTit  and pCount < 5 then
        setOverride = 1
        aPlanets = {pCor, pMet, pSeX, pSeY, pSol, pZon, pMac, pAqu, pFor, pKat, pSez}
        randomPlanet = tonumber(aPlanets[math.random(#aPlanets)])
        forceLevel = 1
    end
    if getNew == 0 then
        mapStage = playerStage
        pCount = pCount + 1
    end
    if pCount >= 5 then
        randomPlanet = tonumber(ePlanets[math.random(#ePlanets)])   
    else
        --Impossible Planets Toggle
        if enable_impossible_planets == 1 then
            aPlanets = {pCor, pTra, pMet, pSeX, pSeY, pSol, pZon, pMac, pTit, pAqu, pFor, pKat, pSez}
        else
            aPlanets = {pCor, pMet, pSeX, pSeY, pSol, pZon, pMac, pTit, pAqu, pFor, pKat, pSez}
        end

        --Ending Stages & Impossible planets toggle
        if enable_ending_stages == 1 and enable_impossible_planets == 1 then
            aPlanets = {pCor, pTra, pMet, pSeX, pSeY, pSol, pZon, pMac, pTit, pAqu, pFor, pKat, pSez, pBol, pAr6, pVe1, pV1T, pVe2}
        end

        --Enable ending stages but disables the impossible ones
        if enable_ending_stages == 1 then
            aPlanets = {pCor, pMet, pSeX, pSeY, pSol, pZon, pMac, pTit, pAqu, pFor, pKat, pSez, pBol, pAr6, pVe1, pV1T, pVe2}
        end
        randomPlanet = tonumber(aPlanets[math.random(#aPlanets)])
        while tonumber(randomPlanet) == tonumber(oldStage) do
            i = i + 1
            randomPlanet = tonumber(aPlanets[math.random(#aPlanets)])
            --newMessage = "OLD STAGE IS SAME AS NEW STAGE, GETTING NEW ONE: " ..i
            emu.frameadvance()  
        end
    end
    --Enables Random Expert Mode
    if enable_expert_mode == 1 then
       getExpert = tonumber(expertMode[math.random(#expertMode)])
    end
end

function resetP()
    randomPlanet = tonumber(oldStage)
end

function randEPickup()
    randomEPickup = tonumber(ePowerUps[math.random(#ePowerUps)])
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
    

while true do
    randEPickup()
	playerLives = tonumber(memory.readbyte(0x157911, "RDRAM"))
	playerStage = tonumber(memory.readbyte(0x16E0A7, "RDRAM"))
	playerState1 = tonumber(memory.readbyte(0x137BAB, "RDRAM"))
	playerState2 = tonumber(memory.readbyte(0x13AA8B, "RDRAM"))
    soundID = tonumber(memory.read_s16_be(0x0C2F06, "RDRAM"))
    mapStatus = tonumber(memory.read_s32_be(0x1C37B4, "RDRAM"))
	if debug == 1 then
		oldLives = playerLives
		oldStage = 8
		endCheck = 1
		getNew = 1
	end
    if pCount >= 5 then
        endGame = 1
    end
    if playerState1 == 1 or playerState2 == 1 then
        forceLevel = 0
        getNew = 0
        setOverride = 0
        endGame = 0
        if pCount == 5 then
            pCount = 0
            getNew = 0
            endCheck = 0
        end
    end
    if playerState1 == 2 or playerState2 == 2 then
        if pChange == 0 then
            randomPortraits()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            pChange = 1
        end
        forceLevel = 0
        getNew = 0
    end
    if playerState1 == 9 or playerState2 == 9 then
        forceLevel = 0
        getNew = 0
    end
    if playerState1 == 8 or playerState2 == 8 then
        forceLevel = 0
        getNew = 0
    end
    if soundID < 2 then
        pChange = 0    
    end
    --ACTUALLY PLAYING THE LEVEL--
	if playerState1 == 3 or playerState2 == 3 then
        if expertMode == 1 then
            memory.write_s32_be(0x16D868, 1, "RDRAM")
        else
            memory.write_s32_be(0x16D868, 0, "RDRAM")
        end
        endGame = 0
        ticked = 0
        if tonumber(memory.read_s16_be(0x0C2F06, "RDRAM")) > 2 then
            if playerStage == 3 or playerStage == 17 then
                forceLevel = 0 
            end
            if pChange == 0 then
                randomPortraits()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                emu.frameadvance()
                memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
                pChange = 1
            end
        end
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
        forceLevel = 0
        --newMessage = "Random Pickup: " ..randomEPickup
		--newMessage = "PlayerState1: " ..playerState1.. " PlayerState2: " .. playerState2.. " Level: " ..tonumber(playerStage)
	end
	if playerState1 == 7 then
        if pChange == 0 then
            randomPortraits()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            pChange = 1
        end
        endCheck = 1
        oldStage = playerStage
		--newMessage = "PS1: OLD STAGE: " .. oldStage
	end
	if playerState2 == 7 then
        if pChange == 0 then
            randomPortraits()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            emu.frameadvance()
            memory.write_s16_be(0x16DBD8, randomPortrait, "RDRAM")
            pChange = 1
        end
        endCheck = 1
        oldStage = playerStage
    end
    if playerStage == 3 or playerStage == 17 then
        forceLevel = 0 
    end
    if mapStatus == 3 then
        if setOverride == 1 then
            memory.writebyte(0x16E0A7, randomPlanet, "RDRAM")
        end
        if oldLives > playerLives then
            resetP()
            forceLevel = 1
            --newMessage = "Staying the old level..."
            getNew = 0
        else
            if endCheck == 1 then
                if ticked == 0 then
                    getNew = 1
                    --newMessage = "Getting random level..."
                end
            end
            if ticked == 1 then
                memory.writebyte(0x16E0A7, randomPlanet, "RDRAM")
            end
        end
    end
		--newMessage = "PS2: OLD STAGE: " .. oldStage
	if endCheck == 1 then
        if forceLevel == 1 then
            if debugMeteo == 1 then
                memory.writebyte(0x16E0A7, 1, "RDRAM")
                --newMessage = "GOING TO METEO!"
            elseif setOverride == 1 then
                memory.writebyte(0x16E0A7, randomPlanet, "RDRAM")
            else
                if mapStatus == 4 then
                    if pCount >= 5 then
                        EndTheGame()
                        memory.writebyte(0x16E0A7, randomPlanet, "RDRAM")
                    end
                    if setOverride == 1 then
                        getRandomAfterTank()
                        memory.writebyte(0x16E0A7, randomPlanet, "RDRAM")
                    end
                    if endGame == 1 then
                        EndTheGame()
                        memory.writebyte(0x16E0A7, randomPlanet, "RDRAM")
                    end
                    --newMessage = "LOOPING: " ..randomPlanet
                    memory.writebyte(0x16E0A7, randomPlanet, "RDRAM")
                    emu.frameadvance()
                end
            end
        end
        --newMessage = "END IS CHECKED..."
        if getNew == 1 then
                debug = 0
                getPlanet()
                if setOverride == 1 then
                    memory.writebyte(0x16E0A7, randomPlanet, "RDRAM")
                end
                if endGame == 1 then
                    memory.writebyte(0x16E0A7, randomPlanet, "RDRAM")
                end
                if pCount >= 5 then
                    memory.writebyte(0x16E0A7, randomPlanet, "RDRAM")
                end
                --newMessage = "WE WENT TO GET A NEW PLANET..."
                forceLevel = 1
                --newMessage = "Got New Planet: " ..randomPlanet.. " Old Stage: " ..oldStage
            if setOverride == 1 then
                if mapStatus == 4 then
                    if randomPlanet ~= playerStage then
                    memory.writebyte(0x16E0A7, randomPlanet, "RDRAM")
                    end
                end
            end
            if endGame == 1 then
                if mapStatus == 4 then
                    if randomPlanet ~= playerStage then
                        memory.writebyte(0x16E0A7, randomPlanet, "RDRAM")
                    end
                end
            end
            if pCount >=5 then
                if mapStatus == 4 then
                    if randomPlanet ~= playerStage then
                        memory.writebyte(0x16E0A7, randomPlanet, "RDRAM")
                    end
                end
            end
            if randomPlanet ~= playerStage then
                memory.writebyte(0x16E0A7, randomPlanet, "RDRAM")
            end
        end
    end
    if endGame == 1 then
        if randomPlanet ~= playerStage then
            memory.writebyte(0x16E0A7, randomPlanet, "RDRAM")
        end
    end
    if setOverride == 1 then
        if randomPlanet ~= playerStage then
            memory.writebyte(0x16E0A7, randomPlanet, "RDRAM")
        end
    end
    --newMessage = pCount
    --newMessage = "Expert mode: " ..getExpert
    --newMessage = "Ticked: " ..ticked.. " Next Stage: " ..randomPlanet.. " pCount: " ..pCount.. " PS1: " ..playerState1.. " PS2: " ..playerState2.. " Set Overide: " ..setOverride
    --newMessage = "Old Stage: " ..oldStage.. " Next Stage: " ..randomPlanet.. " Actual Stage: " ..playerStage.. " Set Override: " ..setOverride.. " pCount: " ..pCount.. " End Game: " ..endGame
	gui.text(0,0,newMessage)
	emu.frameadvance()
end

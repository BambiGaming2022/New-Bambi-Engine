-- This is a template for unlocking achievements after songs. Note that only 1 achievement will be unlocked this way.

local allowEnd = false

function onEndSong()
    if (not botPlay) then
        -- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
        if (not allowEnd) and (misses == 0) then
            setProperty('inCutscene', true);
            callOnLuas('unlockAchievement', {"tutorial_win", getPropertyFromClass('Paths', 'currentModDirectory'), false})
            allowEnd = true;
            runTimer('endSongFromAchievement', 4)
            return Function_Stop;
        end
    end
    return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'endSongFromAchievement' then -- Timer completed, play dialogue
        endSong()
    end
end

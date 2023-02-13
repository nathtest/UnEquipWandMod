local BipedPlayer = nil

function Init()
    BipedPlayer = FindFirstOf("Biped_Player")
    -- print(string.format("BipedPlayer %s..\n", BipedPlayer:GetFullName()))
end


function PlayerUnEquipWand()

    if(BipedPlayer ~= nil)
    then
        BipedPlayer.SetPartialBodyState(17)
        BipedPlayer.UnEquipWand()
        BipedPlayer.SetPartialBodyState(0)
    else
        print("BipedPlayer is nil\n")
    end
end


RegisterKeyBind(Key.F6, function()
    ExecuteInGameThread(function()
        Init()
        -- print("PlayerUnEquipWand\n")
        PlayerUnEquipWand()	
    end)
end)
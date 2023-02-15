local BipedPlayer = nil
local GearManager = nil

function Init()
    BipedPlayer = FindFirstOf("Biped_Player")
    GearManager = FindFirstOf("GearManager")
    IsInitialized = true
end


function PlayerGear()

    if(GearManager:IsValid() and BipedPlayer:IsValid())
    then

        local GearItemID = GearManager.GetEquippedGearItemID(GearManager, BipedPlayer, 1)
     
        if(GearManager.IsHoodUp(GearManager, BipedPlayer))
        then
          GearManager.SetHoodPosition(GearManager, BipedPlayer, GearItemID, false, true) 
        else
          GearManager.SetHoodPosition(GearManager, BipedPlayer, GearItemID, true, true) 
        end
    else
        print("No instance of class 'GearManager' was found.")
    end
end

function PlayerUnEquipWand()

    if(BipedPlayer:IsValid())
    then
        local eGetRightArmState = BipedPlayer.GetRightArmState(15)
        BipedPlayer.SetRightArmState(2, 15, true);
        BipedPlayer.UnEquipWand()	
        BipedPlayer.SetRightArmState(eGetRightArmState, 15, true);
    else
        print("No instance of class 'Biped_Player' was found.")
    end
end


RegisterKeyBind(Key.F6, function()
    ExecuteInGameThread(function()
        Init()
        PlayerUnEquipWand()	
    end)
end)

RegisterKeyBind(Key.F6, {ModifierKey.SHIFT}, function()
    ExecuteInGameThread(function()
        Init()
        -- print("PlayerUnEquipWand\n")
        PlayerUnEquipWand()	
    end)
end)

RegisterKeyBind(Key.F7, function()
    ExecuteInGameThread(function()
        Init()
        PlayerGear()	
    end)
end)

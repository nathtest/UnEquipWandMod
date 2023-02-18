local BipedPlayer = nil
local GearManager = nil

local EGearSlotIDEnum = {
  HEAD = 0,
  OUTFIT = 1,
  BACK = 2,
  NECK = 3,
  HAND = 4,
  FACE = 5,
  Num = 6,
  EGearSlotIDEnum_MAX = 7
}

local EGearSavedItemIDEnum = {
  HEAD = nil,
  OUTFIT = nil,
  BACK = nil,
  NECK = nil,
  HAND = nil,
  FACE = nil,
  Num = nil,
  EGearSlotIDEnum_MAX = nil
}


function Init()
    BipedPlayer = FindFirstOf("Biped_Player")
    GearManager = FindFirstOf("GearManager")
    IsInitialized = true
end


function HoodToggle()

    if(GearManager:IsValid() and BipedPlayer:IsValid())
    then

        local GearItemID = GearManager:GetEquippedGearItemID(BipedPlayer, EGearSlotIDEnum.OUTFIT)
     
        if GearManager:IsHoodUp(BipedPlayer)
        then
          GearManager:SetHoodPosition(BipedPlayer, GearItemID, false, true)
        else
          GearManager:SetHoodPosition(BipedPlayer, GearItemID, true, true)
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


function TogglePlayerGear(SlotID)
    if (GearManager:IsValid() and BipedPlayer:IsValid())
    then
        if (GearManager:CanUnequipActorSlotID(BipedPlayer, SlotID))
        then
            EGearSavedItemIDEnum[SlotID] = GearManager:GetActorEquippedGearItemID(BipedPlayer, SlotID)
            GearManager:UnequipActorSlotID(BipedPlayer, SlotID, true)
        elseif EGearSavedItemIDEnum[SlotID] ~= nil
        then
            GearManager:SetActorEquippedGearItemID(BipedPlayer, EGearSavedItemIDEnum[SlotID], true)
        end
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
        PlayerUnEquipWand()
    end)
end)

RegisterKeyBind(Key.F7, function()
    ExecuteInGameThread(function()
        Init()
        HoodToggle()
    end)
end)


RegisterKeyBind(Key.F1, { ModifierKey.CONTROL }, function()
    ExecuteInGameThread(function()
        Init()
        TogglePlayerGear(EGearSlotIDEnum.HEAD)
    end)
end)

RegisterKeyBind(Key.F2, { ModifierKey.CONTROL }, function()
    ExecuteInGameThread(function()
        Init()
        TogglePlayerGear(EGearSlotIDEnum.OUTFIT)
    end)
end)
RegisterKeyBind(Key.F3, { ModifierKey.CONTROL }, function()
    ExecuteInGameThread(function()
        Init()
        TogglePlayerGear(EGearSlotIDEnum.BACK)
    end)
end)
RegisterKeyBind(Key.F4, { ModifierKey.CONTROL }, function()
    ExecuteInGameThread(function()
        Init()
        TogglePlayerGear(EGearSlotIDEnum.NECK)
    end)
end)
RegisterKeyBind(Key.F5, { ModifierKey.CONTROL }, function()
    ExecuteInGameThread(function()
        Init()
        TogglePlayerGear(EGearSlotIDEnum.HAND)
    end)
end)
RegisterKeyBind(Key.F6, { ModifierKey.CONTROL }, function()
    ExecuteInGameThread(function()
        Init()
        TogglePlayerGear(EGearSlotIDEnum.FACE)
    end)
end)

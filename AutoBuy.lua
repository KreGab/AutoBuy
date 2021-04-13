AutoBuy = { }
AutoBuy.AddOnName = "AutoBuy"
local database = { }
local databaseSchema = { }
local activated = false

function		AutoBuy.BuyProfitablePurchases()
	local selectPurchases = AutoBuy.SelectPurchases
	local executePurchases = AutoBuy.ExecPurchases
	local profitablePurchases = { }

	profitablePurchases = selectPurchases()
	executePurchases(profitablePurchases)
end

function		AutoBuy.OnAddOnLoaded(event, addOnName)
	if (addOnName == AutoBuy.AddOnName) then
		local init = AutoBuy.Init

		init()
	end
end

function		AutoBuy.Init()
	local loadDB = AutoBuy.LoadDatabase
	local loadDBSchema = AutoBuy.LoadDatabaseSchema

	databaseSchema = loadDBSchema()
	database = loadDB()
end

function		AutoBuy.OnSearchFinished(eventCode, responseType, result)
	if (responseType == 14 and activated) then
		local buyProfitablePurchases = AutoBuy.BuyProfitablePurchases

		buyProfitablePurchases()
		SYSTEMS:GetObject("tradingHouse"):CloseTradingHouse()
	end
end

function		AutoBuy.Deactivate()
	activated = false
end

function		AutoBuy.Activate()
	activated = true
end

SLASH_COMMANDS["/aba"] = AutoBuy.Activate
SLASH_COMMANDS["/abd"] = AutoBuy.Deactivate
EVENT_MANAGER:RegisterForEvent(AutoBuy.AddOnName, EVENT_ADD_ON_LOADED, AutoBuy.OnAddOnLoaded)
EVENT_MANAGER:RegisterForEvent(AutoBuy.AddOnName, EVENT_TRADING_HOUSE_RESPONSE_RECEIVED, AutoBuy.OnSearchFinished)

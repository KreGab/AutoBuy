AutoBuy = { }
AutoBuy.AddOnName = "AutoBuy"
local database = { }
local databaseSchema = { }

function		AutoBuy.BuyProfitablePurchases()
	local selectPurchases = AutoBuy.SelectPurchases
	local executePurchases = AutoBuy.ExecPurchases
	local profitablePurchases = { }

	profitablePurchases = selectPurchases()
	executePurchases(profitablePurchases)
end

function		AutoBuy.OnTradingHouseResponseReceived(responseType, result)
	local buyProfitablePurchases = AutoBuy.BuyProfitablePurchases
	local isPendingPurchaseConfirmed = false

	if (result == EVENT_TRADING_HOUSE_CONFIRM_ITEM_PURCHASE ) then
		isPendingPurchaseConfirmed = true
	end

	d(isPendingPurchaseConfirmed)
	d("Finished")
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
	if (responseType == 14) then
		local buyProfitablePurchases = AutoBuy.BuyProfitablePurchases

		buyProfitablePurchases()
	end
	SYSTEMS:GetObject("tradingHouse"):CloseTradingHouse()
end

EVENT_MANAGER:RegisterForEvent(AutoBuy.AddOnName, EVENT_ADD_ON_LOADED, AutoBuy.OnAddOnLoaded)
EVENT_MANAGER:RegisterForEvent(AutoBuy.AddOnName, EVENT_TRADING_HOUSE_RESPONSE_RECEIVED, AutoBuy.OnSearchFinished)

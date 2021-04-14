local purchases = { }
local numPurchases = { }
i = 1

function		AutoBuy.ExecutePurchases(purchasesAsArg)
	d("AutoBuy.ExecutePurchases")
	if (#purchasesAsArg == 0) then
		d("No profitable purchases to execute")
		SYSTEMS:GetObject("tradingHouse"):CloseTradingHouse()
		return
	end
	ExecutePurchasesDelayed(purchasesAsArg, 750)
end

function		ExecutePurchasesDelayed(purchasesAsArg, delay)
	purchases = purchasesAsArg
	numPurchases = #purchases
	d("Number of profitable Purchases " .. numPurchases)
	i = 1
	EVENT_MANAGER:RegisterForUpdate("AutoBuyExecPurchasesDelayed", delay, ExecuteNextPurchaseFromTbl)
end

function		ExecuteNextPurchaseFromTbl()
	SetPendingItemPurchase(purchases[i].Position)
	ConfirmPendingItemPurchase()
	PostExecutedPurchase()
	i = i + 1
	if (i > numPurchases) then
		EVENT_MANAGER:UnregisterForUpdate("AutoBuyExecPurchasesDelayed", ExecuteNextPurchaseFromTbl)
		SYSTEMS:GetObject("tradingHouse"):CloseTradingHouse()
	end
end

function	PostExecutedPurchase()
	d("ItemName " .. purchases[i].ItemName .. " Position " .. purchases[i].Position)
	d("Amount " .. purchases[i].StackCount .. " PricePerUnit " .. purchases[i].PricePerUnit .. " AbsoluteProfitPerUnit " .. purchases[i].AbsoluteProfitPerUnit)
end

local salesList = AutoBuy.GetSalesList()

function		AutoBuy.SelectPurchases()
	local getPossiblePurchase = GetPossiblePurchase
	local calcTradeProfit = CalcTradeProfit
	local profitablePurchases = { }
	local purchase = { }
	local profit = { }
	local numItemsOnPage, _, _ = GetTradingHouseSearchResultsInfo()
	local numProfitablePurchases = 1
	local currPosition = 1

	while (currPosition <= numItemsOnPage) do
		purchase = getPossiblePurchase(currPosition)
		profit = calcTradeProfit(purchase)
		if (profit.IsProfitable == true) then
			purchase.AbsoluteProfitPerUnit = profit.Absolute
			profitablePurchases[numProfitablePurchases] = purchase
			numProfitablePurchases = numProfitablePurchases + 1
		end
		currPosition = currPosition + 1
	end
	d("Profitable Purchases")
	return (profitablePurchases)
end

function		CalcTradeProfit(purchase)
	local i = 1
	local profit = { }
	local salesItem = salesList[purchase.ItemName]

	profit.IsProfitable = false
	if (salesItem == nil) then
		return (profit)
	end
	profit.Absolute = (salesItem.ListPricePerUnit * 0.92) - purchase.PricePerUnit
	profit.Percentage = (((salesItem.ListPricePerUnit * 0.92) / purchase.PricePerUnit) - 1) * 100
	if (profit.Percentage >= salesItem.MinProfitPercentage) then
		d(purchase.ItemName)
		profit.IsProfitable = true
	end
	return (profit)
end

function		ParseToReadableString(itemName)
	return (zo_strformat("<<1>>", itemName))
end

function		GetPossiblePurchase(position)
	local purchase = { }
	local _, itemName, _, stackCount, _, timeRemaining, purchasePrice, currencyType, itemUniqueId, purchasePricePerUnit = GetTradingHouseSearchResultItemInfo(position)

	purchase.ItemName = ParseToReadableString(itemName)
	purchase.StackCount = stackCount
	purchase.TimeRemaining = timeRemaining
	purchase.Price = purchasePrice
	purchase.PricePerUnit = purchasePricePerUnit
	purchase.ItemUniqueId = itemUniqueId
	purchase.Position = position
	return (purchase)
end

function		AutoBuy.ExecPurchases(purchases)
	local numPurchases = #purchases
	local i = 1

	while (i <= numPurchases) do
		SetPendingItemPurchase(purchases[i].Position)
		ConfirmPendingItemPurchase()
		d("ItemName " .. purchases[i].ItemName .. " Position " .. purchases[i].Position)
		d("Amount " .. purchases[i].StackCount .. " PricePerUnit " .. purchases[i].PricePerUnit .. 
			" AbsoluteProfitPerUnit " .. purchases[i].AbsoluteProfitPerUnit)
		i = i + 1
	end
end

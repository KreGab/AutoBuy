function		AutoBuy.ExecPurchases(purchases)
	local numPurchases = #purchases
	local i = 1

	while (i <= numPurchases) do
		d("SetPending for Index: " .. purchases[i].Position)
		SetPendingItemPurchase(purchases[i].Position)
		ConfirmPendingItemPurchase()
		i = i + 1
	end
end

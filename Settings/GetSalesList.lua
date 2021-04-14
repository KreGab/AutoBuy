local DEFAULT_MIN_PROFIT = 5
local salesList = {
	["Ätherischer Staub"] =		{ListPricePerUnit = 340000,		MinProfitPercentage = DEFAULT_MIN_PROFIT},
	["Chromüberzug"] =			{ListPricePerUnit = 140000,		MinProfitPercentage = DEFAULT_MIN_PROFIT},
	["Chromkörner"] =			{ListPricePerUnit = 14000,		MinProfitPercentage = DEFAULT_MIN_PROFIT},
	["Zirkonüberzug"] =			{ListPricePerUnit = 35500,		MinProfitPercentage = DEFAULT_MIN_PROFIT},
	["Zirkonkörner"] =			{ListPricePerUnit = 3550,		MinProfitPercentage = DEFAULT_MIN_PROFIT},
	["Dreughwachs"] =			{ListPricePerUnit = 14250,		MinProfitPercentage = DEFAULT_MIN_PROFIT},
	["Schmiedelegierung"] =		{ListPricePerUnit = 7000,		MinProfitPercentage = DEFAULT_MIN_PROFIT},
	["Harz"] = 					{ListPricePerUnit = 3000,		MinProfitPercentage = 10}
}

function		AutoBuy.GetSalesList()
	return (salesList)
end

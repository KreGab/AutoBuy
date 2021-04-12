local DEFAULT_MIN_PROFIT = 5
local salesList = {
	["Ätherischer Staub"] =		{ListPricePerUnit = 340000,		MinProfitPercentage = DEFAULT_MIN_PROFIT},
	["Chromüberzug"] =			{ListPricePerUnit = 142000,		MinProfitPercentage = DEFAULT_MIN_PROFIT},
	["Chromkörner"] =			{ListPricePerUnit = 14200,		MinProfitPercentage = DEFAULT_MIN_PROFIT},
	["Zirkonüberzug"] =			{ListPricePerUnit = 38500,		MinProfitPercentage = DEFAULT_MIN_PROFIT},
	["Zirkonkörner"] =			{ListPricePerUnit = 3850,		MinProfitPercentage = DEFAULT_MIN_PROFIT},
	["Dreughwachs"] =			{ListPricePerUnit = 14500,		MinProfitPercentage = DEFAULT_MIN_PROFIT},
	["Schmiedelegierung"] =		{ListPricePerUnit = 7250,		MinProfitPercentage = DEFAULT_MIN_PROFIT},
	["Harz"] = 					{ListPricePerUnit = 3000,		MinProfitPercentage = 7},
	["Fett"] =					{ListPricePerUnit = 10,			MinProfitPercentage = DEFAULT_MIN_PROFIT},
	["Tomate"] =				{ListPricePerUnit = 10,			MinProfitPercentage = DEFAULT_MIN_PROFIT}
}

function		AutoBuy.GetSalesList()
	return (salesList)
end

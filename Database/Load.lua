function	AutoBuy.LoadSavedVars()
	database = ZO_SavedVars:NewAccountWide("AutoBuySavedVariables", 1, nil, {})
end

function	AutoBuy.LoadDatabaseSchema()
	local databaseSchema = { }
		Purchase = {
			"ExpectedMargin",
			"PurchasePrice",
			"PurchasePricePerUnit",
			"StackCount",
			"ItemName",
			"ItemUniqueId",
			"TimeRemaining",
			"CreatedDateTime"
		}
	databaseSchema.Purchase = Purchase
	return (databaseSchema)
end

function	AutoBuy.LoadDatabase()
	local serverName = GetWorldName()
	local default = { }
	local savedVarName = "AutoBuySavedVariables"
	local versionNumber = 1

	database = ZO_SavedVars:NewAccountWide(savedVarName, versionNumber, nil, default, serverName)
	return (database)
end

//
//  enums.swift
//  Jonathan_RealEstate
//
//  Created by Jonathan Reátegui on 2024-09-19.
//

let agentCommissionRate = 0.05

enum PropertyArea: String {
    case sq = "Square Meters"
    case ft = "Square Feet"
}

enum ResidencialPropertyType: String {
    case condo = "Condo"
    case apartment = "Apartment"
    case detached = "Detached"
    case semiDetached = "Semi Detached"
}

enum ComercialPropertyType: String {
    case warehouse = "Warehouse"
    case store = "Store"
    case coffeeshop = "Coffeeshop"
}

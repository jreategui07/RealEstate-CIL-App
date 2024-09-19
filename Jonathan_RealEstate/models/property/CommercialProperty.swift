//
//  CommercialProperty.swift
//  Jonathan_RealEstate
//
//  Created by Jonathan Reátegui on 2024-09-19.
//

enum ComercialPropertyType {
    case warehouse
    case store
    case coffeeshop
}

class CommercialProperty: Property {
    var numberOfShelves: Int
    var numberOfExits: Int
    var numberOfStoreys: Int
    var propertyType: ComercialPropertyType

    init(
        id: String,
        address: String,
        area: PropertyArea,
        sellingPrice: Double,
        sellingagent: Agent, // could be empty
        numberOfShelves: Int, 
        numberOfExits: Int,
        numberOfStoreys: Int,
        propertyType: ComercialPropertyType
    ) {
        // TODO: validate values, shouldn't be empty
        self.numberOfShelves = numberOfShelves
        self.numberOfExits = numberOfExits
        self.numberOfStoreys = numberOfStoreys
        self.propertyType = propertyType
        super.init(
            id: id,
            address: address,
            area: area,
            sellingPrice: sellingPrice,
            sellingagent: sellingagent
        )
    }
    
    override var propertyDescription: String {
        return super.propertyDescription + ", Number of shelves: \(numberOfShelves), Number of exits: \(self.numberOfExits), Number of storeys: \(self.numberOfStoreys),Property type: \(self.propertyType)"
    }
}

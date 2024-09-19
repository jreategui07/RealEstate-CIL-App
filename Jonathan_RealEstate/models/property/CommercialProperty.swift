//
//  CommercialProperty.swift
//  Jonathan_RealEstate
//
//  Created by Jonathan Reátegui on 2024-09-19.
//

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
        sellingagent: Agent?,
        numberOfShelves: Int, 
        numberOfExits: Int,
        numberOfStoreys: Int,
        propertyType: ComercialPropertyType
    ) {
        guard numberOfShelves > 0 else {
            fatalError("Number of shelves must be greater than 0.")
        }
        
        guard numberOfExits > 0 else {
            fatalError("Number of exits must be greater than 0.")
        }
        
        guard numberOfStoreys > 0 else {
            fatalError("Number of storeys must be greater than 0.")
        }
        
        self.numberOfShelves = numberOfShelves
        self.numberOfExits = numberOfExits
        self.numberOfStoreys = numberOfStoreys
        self.propertyType = propertyType
        super.init(
            id: id,
            address: address,
            area: area,
            sellingPrice: sellingPrice,
            sellingagent: sellingagent ?? Agent.defaultAgent()
        )
    }
    
    override var propertyDescription: String {
        return super.propertyDescription + ", Number of shelves: \(numberOfShelves), Number of exits: \(self.numberOfExits), Number of storeys: \(self.numberOfStoreys),Property type: \(self.propertyType)"
    }
}

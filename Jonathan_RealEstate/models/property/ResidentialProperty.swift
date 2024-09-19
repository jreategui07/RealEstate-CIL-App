//
//  ResidencialProperty.swift
//  Jonathan_RealEstate
//
//  Created by Jonathan Reátegui on 2024-09-19.
//

class ResidentialProperty: Property {
    var numberOfBedrooms: Int
    var numberOfBathrooms: Int
    var propertyType: ResidencialPropertyType
    
    init(
        id: String,
        address: String,
        area: PropertyArea,
        sellingPrice: Double,
        sellingagent: Agent?,
        numberOfBedrooms: Int,
        numberOfBathrooms: Int,
        propertyType: ResidencialPropertyType
    ) {
        guard numberOfBedrooms > 0 else {
            fatalError("Number of bedrooms must be greater than 0.")
        }
        
        guard numberOfBathrooms > 0 else {
            fatalError("Number of bathrooms must be greater than 0.")
        }
        
        self.numberOfBedrooms = numberOfBedrooms
        self.numberOfBathrooms = numberOfBathrooms
        self.propertyType = propertyType
        super.init(
            id: id,
            address: address,
            area: area,
            sellingPrice: sellingPrice,
            sellingagent: sellingagent ?? nil
        )
    }
    
    override var propertyDescription: String {
        return super.propertyDescription + """
            
            Number of bedrooms: \(self.numberOfBedrooms)
            Number of bathrooms: \(self.numberOfBathrooms)
            Property type: \(self.propertyType)
            """
    }
}

//
//  ResidencialProperty.swift
//  Jonathan_RealEstate
//
//  Created by Jonathan Reátegui on 2024-09-19.
//

import Foundation

enum ResidencialPropertyType {
    case condo
    case apartment
    case detached
    case semiDetached
}

class ResidencialProperty: Property {
    var numberOfBedrooms: Int
    var numberOfBathrooms: Int
    var propertyType: ResidencialPropertyType
    
    init(
        id: String,
        address: String,
        area: PropertyArea,
        sellingPrice: Double,
        sellingagent: Agent, // could be empty
        numberOfBedrooms: Int,
        numberOfBathrooms: Int,
        propertyType: ResidencialPropertyType
    ) {
        // TODO: validate values, shouldn't be empty
        self.numberOfBedrooms = numberOfBedrooms
        self.numberOfBathrooms = numberOfBathrooms
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
        return super.propertyDescription + ", Number of bedrooms: \(numberOfBedrooms), Number of bathrooms: \(self.numberOfBathrooms), Property type: \(self.propertyType)"
    }
}

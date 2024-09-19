//
//  Manager.swift
//  Jonathan_RealEstate
//
//  Created by Jonathan Reátegui on 2024-09-19.
//

class Manager {
    var residencialProperties: [ResidencialProperty]
    var commercialProperties: [ComercialPropertyType]
    
    init(
        residencialProperties: [ResidencialProperty],
        commercialProperties: [ComercialPropertyType]
    ) {
        self.residencialProperties = residencialProperties
        self.commercialProperties = commercialProperties
    }
    
    func createProperty(property: Property) {
        // todo
    }
    
    func updateProperty(propertyId: String) {
        // todo
    }
    
    func removeProperty(propertyId: String) {
        // todo
    }
    
    func assignAgentProperty() { // as a selling property.
        // todo
    }
    
    func searchPropertyByPropertyType() {
        
    }
    
    func searchPropertyByAddress() {
        // todo
        // example, show all warehouses in Brampton
    }
    
    func searchPropertyByPrice() {
        // todo
        // example, show all the residen:al proper:es in Toronto with selling price less than 1M.
    }
}

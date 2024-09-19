//
//  Manager.swift
//  Jonathan_RealEstate
//
//  Created by Jonathan Reátegui on 2024-09-19.
//

class Manager {
    var residencialProperties: [ResidentialProperty]
    var commercialProperties: [CommercialProperty]
    
    init(
        residencialProperties: [ResidentialProperty],
        commercialProperties: [CommercialProperty]
    ) {
        self.residencialProperties = residencialProperties
        self.commercialProperties = commercialProperties
    }
    
    func assignAgentToProperty(agent: Agent, propertyId: String) {
        if let residentialProperty = residencialProperties.first(where: { $0.id == propertyId }) {
            residentialProperty.sellingAgent = agent
            agent.sellingProperties.append(residentialProperty)
            print("Agent \(agent.name) assigned to residential property with ID \(propertyId)")
        } else if let commercialProperty = commercialProperties.first(where: { $0.id == propertyId }) {
            commercialProperty.sellingAgent = agent
            agent.sellingProperties.append(commercialProperty)
            print("Agent \(agent.name) assigned to commercial property with ID \(propertyId)")
        } else {
            print("Property with ID \(propertyId) not found")
        }
    }
    
    func addResidencialProperty(property: ResidentialProperty) {
        residencialProperties.append(property)
        print("Residential property added the list of manager")
    }
    
    func addComercialProperty(property: CommercialProperty) {
        commercialProperties.append(property)
        print("Commercial property added the list of manager")
    }
    
    func displayPropertiesByPrice() {
        let allProperties: [Property] = residencialProperties + commercialProperties
        let sortedProperties = allProperties.sorted { $0.sellingPrice < $1.sellingPrice }
        for property in sortedProperties {
            print(property.propertyDescription)
        }
    }
    
    func updatePropertyAttributes(
        propertyId: String,
        newAddress: String?,
        newPrice: Double?,
        newBedrooms: Int?,
        newBathrooms: Int?,
        newShelves: Int?,
        newExits: Int?
    ) {
        if let residentialProperty = residencialProperties.first(where: { $0.id == propertyId }) {
            if let newAddress = newAddress { residentialProperty.address = newAddress }
            if let newPrice = newPrice { residentialProperty.sellingPrice = newPrice }
            if let newBedrooms = newBedrooms { residentialProperty.numberOfBedrooms = newBedrooms }
            if let newBathrooms = newBathrooms { residentialProperty.numberOfBathrooms = newBathrooms }
            print("Residential property with ID \(propertyId) updated")
        } else if let commercialProperty = commercialProperties.first(where: { $0.id == propertyId }) {
            if let newAddress = newAddress { commercialProperty.address = newAddress }
            if let newPrice = newPrice { commercialProperty.sellingPrice = newPrice }
            if let newShelves = newShelves { commercialProperty.numberOfShelves = newShelves }
            if let newExits = newExits { commercialProperty.numberOfExits = newExits }
            print("Commercial property with ID \(propertyId) updated")
        } else {
            print("Property with ID \(propertyId) not found")
        }
    }

    func deleteProperty(propertyId: String) {
        if let index = residencialProperties.firstIndex(where: { $0.id == propertyId }) {
            residencialProperties.remove(at: index)
            print("Residential property with ID \(propertyId) deleted")
        } else if let index = commercialProperties.firstIndex(where: { $0.id == propertyId }) {
            commercialProperties.remove(at: index)
            print("Commercial property with ID \(propertyId) deleted")
        } else {
            print("Property with ID \(propertyId) not found")
        }
    }
    
    func searchPropertyById(propertyId: String) -> Property? {
        if let residentialProperty = residencialProperties.first(where: { $0.id == propertyId }) {
            return residentialProperty
        } else if let commercialProperty = commercialProperties.first(where: { $0.id == propertyId }) {
            return commercialProperty
        } else {
            print("Property with ID \(propertyId) not found")
            return nil
        }
    }

    func searchPropertyByAgentId(agentId: String) -> [Property] {
        let allProperties = residencialProperties + commercialProperties
        let filteredProperties = allProperties.filter { $0.sellingAgent?.id == agentId }
        
        if filteredProperties.isEmpty {
            print("No properties found for agent ID \(agentId)")
        }
        return filteredProperties
    }
    
    func highestEarningAgent(agents: [Agent]) {
        guard !agents.isEmpty else {
            print("No agents found")
            return
        }

        let highestEarningAgent = agents.max(by: { $0.totalCommission() < $1.totalCommission() })
        
        if let agent = highestEarningAgent {
            print("""
            -------------------------------------------------
            Highest earning agent: \(agent.name)
            ID: \(agent.id)
            Email: \(agent.email)
            Total commission earned: \(agent.totalCommission())
            -------------------------------------------------
            """)
        }
    }
}

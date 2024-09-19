//
//  main.swift
//  Jonathan_RealEstate
//
//  Created by Jonathan Reátegui on 2024-09-19.
//

import Foundation

func main() {
    // 1. Create at least 5 objects of ResidentialProperty and CommercialProperty
    
    let residentialProperty1 = ResidentialProperty(
        id: UUID().uuidString,
        address: "123 Maple St",
        area: PropertyArea.sq,
        sellingPrice: 850000,
        sellingagent: nil,
        numberOfBedrooms: 3,
        numberOfBathrooms: 2,
        propertyType: ResidencialPropertyType.detached
    )

    let residentialProperty2 = ResidentialProperty(
        id: UUID().uuidString,
        address: "456 Oak St",
        area: PropertyArea.sq,
        sellingPrice: 750000,
        sellingagent: nil,
        numberOfBedrooms: 4,
        numberOfBathrooms: 3,
        propertyType: ResidencialPropertyType.semiDetached
    )

    let residentialProperty3 = ResidentialProperty(
        id: UUID().uuidString,
        address: "789 Pine St",
        area: PropertyArea.sq,
        sellingPrice: 600000,
        sellingagent: nil,
        numberOfBedrooms: 2,
        numberOfBathrooms: 1,
        propertyType: ResidencialPropertyType.apartment
    )

    let commercialProperty1 = CommercialProperty(
        id: UUID().uuidString,
        address: "100 King St",
        area: PropertyArea.ft,
        sellingPrice: 1500000,
        sellingagent: nil,
        numberOfShelves: 20,
        numberOfExits: 4,
        numberOfStoreys: 10,
        propertyType: ComercialPropertyType.warehouse
    )

    let commercialProperty2 = CommercialProperty(
        id: UUID().uuidString,
        address: "200 Queen St",
        area: PropertyArea.ft,
        sellingPrice: 1200000,
        sellingagent: nil,
        numberOfShelves: 10,
        numberOfExits: 2,
        numberOfStoreys: 3,
        propertyType: ComercialPropertyType.coffeeshop
    )
    
    print(residentialProperty1.propertyDescription)
    print(residentialProperty2.propertyDescription)
    print(residentialProperty3.propertyDescription)
    
    // One of the objects of ResidentialProperty and CommercialProperty classes should demonstrate the use of failable initializer (Error message)
    
//    let residentialProperty4 = ResidentialProperty(
//        id: UUID().uuidString,
//        address: "321 Birch St",
//        area: PropertyArea.sq,
//        sellingPrice: 680000,
//        sellingagent: agent2,
//        numberOfBedrooms: -1,
//        numberOfBathrooms: 2,
//        propertyType: ResidencialPropertyType.condo
//    )

//    let commercialProperty3 = CommercialProperty(
//        id: UUID().uuidString,
//        address: "300 Elm St",
//        area: PropertyArea.ft,
//        sellingPrice: 1800000,
//        sellingagent: nil,
//        numberOfShelves: 15,
//        numberOfExits: -1,
//        numberOfStoreys: 5,
//        propertyType: ComercialPropertyType.store
//    )
    
    // 2. Create at least 3 object of Agent class. Use hard-coded data.
    
    let agent1 = Agent(
        id: UUID().uuidString,
        name: "John Doe",
        email: "john.doe@example.com",
        comisionRate: agentCommissionRate
    )

    let agent2 = Agent(
        id: UUID().uuidString,
        name: "Jane Smith",
        email: "jane.smith@example.com",
        comisionRate: agentCommissionRate
    )

    let agent3 = Agent(
        id: UUID().uuidString,
        name: "Alice Johnson",
        email: "alice.johnson@example.com",
        comisionRate: agentCommissionRate
    )
    
    print(agent1.agentDescription)
    print(agent2.agentDescription)
    print(agent3.agentDescription)

    // 3. Create an object of Manager class. Use hard-coded data.
    
    let residentialPropertiesList: [ResidentialProperty] = [
        residentialProperty1,
        residentialProperty2,
        residentialProperty3,
    ]

    let commercialPropertiesList: [CommercialProperty] = [
        commercialProperty1,
        commercialProperty2,
    ]

    let manager = Manager(
        residencialProperties: residentialPropertiesList,
        commercialProperties: commercialPropertiesList
    )
    
    // 4. Assign different agents to different properties.
    
    print("""
        ------------------------------------------
        Adding agents to properties
        ------------------------------------------
        """)
    
    manager.assignAgentToProperty(
        agent: agent1,
        propertyId: residentialProperty1.id
    )
    
    manager.assignAgentToProperty(
        agent: agent2,
        propertyId: residentialProperty2.id
    )
    
    manager.assignAgentToProperty(
        agent: agent3,
        propertyId: commercialProperty1.id
    )
    
    print(residentialProperty1.propertyDescription)
    print(residentialProperty2.propertyDescription)
    print(commercialProperty1.propertyDescription)
    
    // 5. Add all the 8 objects of properties you create in first step to the list of properties of manager class object.
    // Note: Where added in step 3 by default when creating the manager object
    // Below we show how the add property methods work for comercial and residential property
    
    print("""
        ------------------------------------------
        Adding more properties to manager
        ------------------------------------------
        """)
    
    let residentialProperty4 = ResidentialProperty(
        id: UUID().uuidString,
        address: "321 Birch St",
        area: PropertyArea.sq,
        sellingPrice: 680000,
        sellingagent: agent2,
        numberOfBedrooms: 3,
        numberOfBathrooms: 2,
        propertyType: ResidencialPropertyType.condo
    )
    manager.addResidencialProperty(property: residentialProperty4)

    let commercialProperty3 = CommercialProperty(
        id: UUID().uuidString,
        address: "300 Elm St",
        area: PropertyArea.ft,
        sellingPrice: 1800000,
        sellingagent: nil,
        numberOfShelves: 15,
        numberOfExits: 3,
        numberOfStoreys: 5,
        propertyType: ComercialPropertyType.store
    )
    manager.addComercialProperty(property: commercialProperty3)
    
    print(residentialProperty4.propertyDescription)
    print(commercialProperty3.propertyDescription)
    
    // Display all the properties in the increasing order of their selling price. (hint: use closure to sort)
    
    print("""
        ------------------------------------------
        Displaying properties sorted by price asc
        ------------------------------------------
        """)
    
    manager.displayPropertiesByPrice()
    
    // 6. Modify adributes of at least 1 property object.
    
    print("""
        ------------------------------------------
        Updating adributes of 2 properties
        ------------------------------------------
        """)
    
    manager.updatePropertyAttributes(
        propertyId: residentialProperty1.id,
        newAddress: "999 New Street",
        newPrice: 900000,
        newBedrooms: 4,
        newBathrooms: 3,
        newShelves: nil,
        newExits: nil
    )

    manager.updatePropertyAttributes(
        propertyId: commercialProperty1.id,
        newAddress: nil,
        newPrice: 1600000,
        newBedrooms: nil,
        newBathrooms: nil,
        newShelves: 25,
        newExits: 5
    )
    
    print(residentialProperty1.propertyDescription)
    print(commercialProperty1.propertyDescription)
    
    // 7. Delete at least 1 object from the property list
    
    print("""
        ------------------------------------------
        Removing 2 properties
        ------------------------------------------
        """)
    
    manager.deleteProperty(propertyId: residentialProperty1.id)
    manager.deleteProperty(propertyId: commercialProperty1.id)
    manager.displayPropertiesByPrice()
    
    // 8. Demonstrate the use of searching property operation using the various functions from Manager class.
    
    print("""
        ------------------------------------------
        Searching properties by property ID
        ------------------------------------------
        """)
    
    
    if let foundProperty = manager.searchPropertyById(propertyId: residentialProperty2.id) {
        print("Property found with ID \(residentialProperty2.id)")
        print("\(foundProperty.propertyDescription)")
    } else {
        print("No property found with that ID.")
    }
    
    print("""
        ------------------------------------------
        Searching properties by agent ID
        ------------------------------------------
        """)

    let propertiesByAgent = manager.searchPropertyByAgentId(agentId: agent2.id)
    if !propertiesByAgent.isEmpty {
        print("Properties found to agent with ID: \(agent2.id)")
        for property in propertiesByAgent {
            print(property.propertyDescription)
        }
    }

    // 9. Demonstrate the operation where an agent is trying to sell a property.
    // Show appropriate informational message for user along with agent and property details.
    // Choice of agent and property object is yours.
    
    print("""
        ------------------------------------------
        Agent is trying to sell a property
        ------------------------------------------
        """)
    
    agent2.sellProperty(propertyId: residentialProperty2.id)
    
    // 10. Demonstrate the operation where an agent is trying to buy a property, and they are successful as per the rules stated in Agent class.
    // Show appropriate informational message for user along with agent and property details.
    
    print("""
        ------------------------------------------
        Agent is trying to buy a property - Success
        ------------------------------------------
        """)
    
    agent1.buyProperty(propertyId: residentialProperty2.id, from: manager)
    
    // 11. Demonstrate the operation where an agent is trying to buy a property, and they are unsuccessful as per the rules stated in Agent class.
    // Show appropriate informational message for user along with agent and property details.
    
    print("""
        ------------------------------------------
        Agent is trying to buy a property - Error
        ------------------------------------------
        """)
    
    agent1.buyProperty(propertyId: residentialProperty2.id, from: manager)
    
    // 12. Show the highest earning (maximum commission) agent information.
    
    print("""
        ------------------------------------------
        Show the highest earning agent
        ------------------------------------------
        """)
    
    manager.highestEarningAgent(agents: [agent1, agent2, agent3])
}

main()

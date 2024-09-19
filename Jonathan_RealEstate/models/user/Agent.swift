//
//  Agent.swift
//  Jonathan_RealEstate
//
//  Created by Jonathan Reátegui on 2024-09-19.
//

class Agent: AgentDescription {
    var id: String
    var name: String
    var email: String
    var sellingProperties: [Property]
    var buyingProperties: [Property]
    var comisionRate: Double
    
    init(
        id: String,
        name: String,
        email: String,
        sellingProperties: [Property] = [],
        buyingProperties: [Property] = [],
        comisionRate: Double = agentCommissionRate
    ) {
        guard !id.isEmpty else {
            fatalError("ID cannot be empty.")
        }

        guard !name.isEmpty else {
            fatalError("Name cannot be empty.")
        }

        guard !email.isEmpty else {
            fatalError("Email cannot be empty.")
        }

        self.id = id
        self.name = name
        self.email = email
        self.sellingProperties = sellingProperties
        self.buyingProperties = buyingProperties
        self.comisionRate = comisionRate
    }
    
    var agentDescription: String {
        return """
            ------------------------------------------
            Agent desription
            ------------------------------------------
            ID: \(self.id)
            Agent: \(self.name)
            Email: \(self.email)
            List of selling properties: \(self.sellingProperties.count)
            List of buying properties: \(self.buyingProperties.count)
            Comision rate: \(self.comisionRate)
            """
    }
    
    func sellProperty(propertyId: String) {
        guard let propertyToSell = sellingProperties.first(where: { $0.id == propertyId }) else {
            print("Error: The agent \(self.name) is not assigned to sell the property with ID \(propertyId)")
            return
        }
        
        print("""
        -------------------------------------------------
        Agent \(self.name) is attempting to sell the property
        Property ID: \(propertyToSell.id)
        Address: \(propertyToSell.address)
        Selling Price: \(propertyToSell.sellingPrice)
        Final Price (with commission): \(propertyToSell.finalPrice)
        -------------------------------------------------
        """)
    }

    func buyProperty(propertyId: String, from manager: Manager) {
        guard let propertyToBuy = manager.searchPropertyById(propertyId: propertyId) else {
            print("Error: Property with ID \(propertyId) not found in the manager's list.")
            return
        }

        // An agent cannot buy the same property they already own
        guard !buyingProperties.contains(where: { $0.id == propertyId }) else {
            print("Error: Agent \(self.name) already owns the property with ID \(propertyId).")
            return
        }
        
        // An agent cannot buy the same property they are selling
        guard propertyToBuy.sellingAgent?.id != self.id else {
            print("Error: Agent \(self.name) cannot buy a property they are selling.")
            return
        }

        // An agent cannot buy a property if the property doesn’t have a selling agent
        guard let sellingAgent = propertyToBuy.sellingAgent else {
            print("Error: The property with ID \(propertyId) does not have a selling agent assigned.")
            return
        }
        
        // Add the property to the agent's list of purchased properties
        buyingProperties.append(propertyToBuy)
        print("""
        -------------------------------------------------
        Success! Agent \(self.name) has successfully bought the property:
        Property ID: \(propertyToBuy.id)
        Address: \(propertyToBuy.address)
        Selling Price: \(propertyToBuy.sellingPrice)
        Commission for the selling agent \(sellingAgent.name): \(propertyToBuy.comision)
        Final Price: \(propertyToBuy.finalPrice)
        -------------------------------------------------
        """)
    }
    
    func totalCommission() -> Double {
        return sellingProperties.reduce(0) { $0 + $1.comision }
    }
}

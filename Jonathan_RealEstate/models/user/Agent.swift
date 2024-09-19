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
    
    func buyProperty(propertyId: String) {
        guard let propertyToBuy = sellingProperties.first(where: { $0.id == propertyId }) else {
            fatalError("Property with ID \(propertyId) not found.")
        }
       
        // An agent cannot buy the same property they are selling
        guard propertyToBuy.sellingAgent?.id == self.id else {
            fatalError("Error: An agent cannot buy a property they are selling.")
        }
        
        // An agent cannot buy a property if the property doesn’t have a selling agent
        guard propertyToBuy.sellingAgent != nil else {
            fatalError("Error: The property must have a selling agent assigned.")
        }
        
        // Buy the property
        buyingProperties.append(propertyToBuy)
        print("Property with ID \(propertyId) successfully bought by agent \(self.name).")
    }
    
    func sellProperty(propertyId: String) {
        guard sellingProperties.contains(where: { $0.id == propertyId }) else {
            print("Error: The agent is already selling or owns the property with ID \(propertyId).")
            return
        }
        
        // find property to sell
        
//        listOfProperties.append(propertyToSell)
//        print("Property with ID \(propertyId) successfully added to the selling list by agent \(self.name).")
    }
}

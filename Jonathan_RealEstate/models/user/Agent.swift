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
    var listOfProperties: [Property] // selling or buying
    var comisionRate: Double // commission they earn
    
    init(id: String, name: String, email: String, listOfProperties: [Property], comisionRate: Double) {
        self.id = id
        self.name = name
        self.email = email
        self.listOfProperties = listOfProperties
        self.comisionRate = comisionRate
    }
    
    var agentDescription: String {
        return "Agent desription \n ID: \(self.id), Name: \(self.name), Email: \(self.email), List of properties: \(self.listOfProperties), Comision rate: \(self.comisionRate) "
    }
    
    func buyProperty(propertyId: String) {
       // An agent cannot buy the same property they are selling
       // An agent cannot buy a property if the property doesn’t have a selling agent
    }
    
    func sellProperty(propertyId: String) {
        
    }
}
//
//  Property.swift
//  Jonathan_RealEstate
//
//  Created by Jonathan Reátegui on 2024-09-19.
//

class Property: PropertyDescription {
    var id: String
    var address: String
    var area: PropertyArea
    var sellingPrice: Double
    var sellingagent: Agent
    
    var comision: Double
    var finalPrice: Double
    
    init(id: String, address: String, area: PropertyArea, sellingPrice: Double, sellingagent: Agent) {
        guard !id.isEmpty else {
            fatalError("ID cannot be empty.")
        }

        guard !address.isEmpty else {
            fatalError("Address cannot be empty.")
        }

        guard sellingPrice > 0 else {
            fatalError("Selling price must be greater than 0.")
        }

        self.id = id
        self.address = address
        self.area = area
        self.sellingPrice = sellingPrice
        self.sellingagent = sellingagent
        self.comision = self.sellingPrice * agentCommissionRate
        self.finalPrice = self.sellingPrice + self.comision
    }
    
    var propertyDescription: String {
        return "Property desription \n ID: \(self.id), Address: \(self.address), Area: \(self.area), Selling Price: \(self.sellingPrice), Selling Agent: \(self.sellingagent) "
    }
    
    func displayCommissionAndFinalPrice() {
        print("The comision of this property is: \(self.comision) with final price: \(self.finalPrice)")
    }
}

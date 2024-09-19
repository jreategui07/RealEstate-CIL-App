//
//  Property.swift
//  Jonathan_RealEstate
//
//  Created by Jonathan Reátegui on 2024-09-19.
//

enum PropertyArea {
    case sq
    case ft
}

let COMISION = 0.05

class Property: PropertyDescription {
    var id: String
    var address: String
    var area: PropertyArea
    var sellingPrice: Double
    var sellingagent: Agent
    
    var comision: Double
    var finalPrice: Double
    
    init(id: String, address: String, area: PropertyArea, sellingPrice: Double, sellingagent: Agent) {
        // TODO: validate values, shouldn't be empty
        self.id = id
        self.address = address
        self.area = area
        self.sellingPrice = sellingPrice
        self.sellingagent = sellingagent
        self.comision = self.sellingPrice * COMISION // (5%) on the property’s selling price
        self.finalPrice = self.sellingPrice + self.comision
    }
    
    var propertyDescription: String {
        return "Property desription \n ID: \(self.id), Address: \(self.address), Area: \(self.area), Selling Price: \(self.sellingPrice), Selling Agent: \(self.sellingagent) "
    }
    
    func displayCommissionAndFinalPrice() {
        print("The comision of this property is: \(self.comision) with final price: \(self.finalPrice)")
    }
}

//
//  Order.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 28/10/2021.
//

import Foundation

struct Order:Identifiable, Codable{
    let id: String
    let cofName, size, milk, sugar: String
}

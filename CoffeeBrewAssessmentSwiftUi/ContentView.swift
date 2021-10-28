//
//  ContentView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Clinton Davelaar on 18/10/2021.
//

import SwiftUI
import Combine

struct SubSelection: Codable, Hashable {
    let _id: String
    var name: String
}

struct Extra: Codable, Hashable  {
    let _id: String
    var name: String
    var subselections: [SubSelection]
    
}

struct Size: Codable, Hashable {
    let _id: String
    var name: String
}

struct Coffee: Codable {
    let _id: String
    var name: String
    var sizes: [String]
    var extras: [String]
}

struct CoffeeMachine: Codable {
    let _id: String
    var types: [Coffee]
    var sizes: [Size]
    var extras: [Extra]
}

struct ContentView: View {
    
//    @State private var coffeeMachine: CoffeeMachine?
    
    var body: some View {
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

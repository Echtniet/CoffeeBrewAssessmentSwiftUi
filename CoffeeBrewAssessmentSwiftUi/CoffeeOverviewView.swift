//
//  CoffeeOverviewView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 19/10/2021.
//

import Foundation
import SwiftUI

struct CoffeeOverviewView: View {
    
    @ObservedObject var coffeeMac: CoffeeMachineClass
    @State private var showCoffeeOptions = false
    
    var body: some View {
        HStack {
            Image((coffeeMac.coffee.name != "Ristretto") ? ((coffeeMac.coffee.name == "Espresso") ? "expresso" : "cappuccino"):"lungo")
                .resizable()
                .clipShape(Circle())
                .frame(width:60, height: 60)
                .clipped()
            Text(coffeeMac.coffee.name)
                .foregroundColor(Color.white)
            Spacer()
            Text("Edit")
                .foregroundColor(Color.white)
                .onTapGesture {
                    withAnimation{
                        showCoffeeOptions.toggle()
                    }
                }
        }
        if showCoffeeOptions{
            ForEach(coffeeMac.types!, id: \._id){ typeCof in
                HStack {
                    Text(typeCof.name)
                        .foregroundColor(Color.white)
                    Spacer()
                    
                }
                .padding(16)
                .background(Color(hex: 0xA0CC8C))
                .cornerRadius(5)
                .onTapGesture {
                    coffeeMac.coffee = typeCof
                    withAnimation{
                        showCoffeeOptions.toggle()
                    }
                }
            }
        }
    }
}

//
//  ExtraView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 19/10/2021.
//

import Foundation
import SwiftUI

struct ExtraView: View {
    
    @ObservedObject var coffeeMac: CoffeeMachineClass
    
    @State private var showCoffeeOptions = false
    @State private var showMilkOptions = false
    
    var body: some View {
        if coffeeMac.coffee.extras.contains(coffeeMac.extras![1]._id) {
            ExtraInfoView(coffeeMac: coffeeMac, selected: coffeeMac.selectedMilk, milk: 1)
        }
        if coffeeMac.coffee.extras.contains(coffeeMac.extras![0]._id) {
            ExtraInfoView(coffeeMac: coffeeMac, selected: coffeeMac.selectedCoffee, milk: 0)
        }
    }
}

struct ExtraInfoView: View {
    @ObservedObject var coffeeMac: CoffeeMachineClass
    
    @State private var showOptions = false
    @State var selected: String
    var milk: Int
    
    var body: some View {
        VStack {
            HStack {
                Image((coffeeMac.extras![milk].name == "Select the amount of sugar") ? "cappuccino":"milk")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width:60, height: 60)
                    .clipped()
                Text(coffeeMac.extras![milk].name)
                    .foregroundColor(Color.white)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(){
                    showOptions.toggle()
                }
            }
            if showOptions {
                Divider()
                    .background(Color.white)
                RadioButtons(coffeeMac: coffeeMac, selected: self.$selected, milk: milk, subSelections: coffeeMac.extras![milk].subselections)
                    //.transition(.opacity)
            }
        }
        .padding(20)
        .background(Color(hex: 0xAED7A0))
        
    }
}


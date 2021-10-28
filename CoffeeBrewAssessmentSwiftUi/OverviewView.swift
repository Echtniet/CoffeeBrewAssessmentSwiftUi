//
//  OverviewView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 19/10/2021.
//

import Foundation
import SwiftUI

struct OverviewView: View {
    
    @ObservedObject var coffeeMac: CoffeeMachineClass
    
//    @Binding var coffee: Coffee
//    @Binding var size: Size
//    @Binding var milk: String
//    @Binding var sugar: String
//    @State var coffeeMachine: CoffeeMachine
    var body: some View {
        
        VStack (alignment: .leading){
            Text("Overview")
                .font(.system(size: 30))
            ScrollView (.vertical) {
                VStack {
                    CoffeeOverviewView(coffeeMac: coffeeMac)
                    
                    Divider()
                    SizeOverviewView(coffeeMac: coffeeMac)
                    if coffeeMac.coffee.extras.contains(coffeeMac.extras![1]._id) {

                        Divider()
                        MilkOverviewView(coffeeMac: coffeeMac, selected: coffeeMac.selectedMilk)
                    }
//
                    if coffeeMac.coffee.extras.contains(coffeeMac.extras![0]._id) {

                        Divider()
                        SugarOverviewView(coffeeMac: coffeeMac, selected: coffeeMac.selectedCoffee)
                    }
                    
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                .background(Color(hex: 0xAED7A0))
                .cornerRadius(5)
            }
            Spacer()
            HStack {
                
                Text("Brew your coffee")
                    .foregroundColor(Color.white)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 40)
            .background(Color(hex: 0xAED7A0))
            .cornerRadius(5)
        }.padding(.horizontal, 20 )
    }
}



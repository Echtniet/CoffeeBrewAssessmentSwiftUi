//
//  OverviewView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 19/10/2021.
//

import Foundation
import SwiftUI

struct OverviewView: View {
    
    @Binding var coffee: Coffee
    @Binding var size: Size
    @Binding var milk: String
    @Binding var sugar: String
    @State var coffeeMachine: CoffeeMachine
    var body: some View {
        
        VStack (alignment: .leading){
            Text("Overview")
                .font(.system(size: 30))
            ScrollView (.vertical) {
                VStack {
                    CoffeeOverviewView(coffee: self.$coffee, coffeeMachine: self.coffeeMachine)
                    
                    Divider()
                    SizeOverviewView(size: self.$size, coffeeMachine: self.coffeeMachine, sizes: coffee.sizes)
                    if coffee.extras.contains(coffeeMachine.extras[1]._id) {
                   
                        Divider()
                        MilkOverviewView(milk: self.$milk, coffeeMachine: coffeeMachine)
                    }
                    
                    if coffee.extras.contains(coffeeMachine.extras[0]._id) {
                   
                        Divider()
                        SugarOverviewView(sugar: self.$sugar, coffeeMachine: coffeeMachine)
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



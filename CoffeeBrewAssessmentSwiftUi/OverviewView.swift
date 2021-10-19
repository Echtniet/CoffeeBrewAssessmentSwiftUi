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
    @State private var showCoffeeOptions = false
    
    var body: some View {
        
        VStack (alignment: .leading){
            Text("Overview")
                .font(.system(size: 30))
            ScrollView (.vertical) {
                VStack {
                    CoffeeOverviewView(coffee: self.$coffee, coffeeMachine: self.coffeeMachine)
                    
                    Divider()
                    SizeOverviewView(size: self.$size, coffeeMachine: self.coffeeMachine, sizes: coffee.sizes)
                    Divider()
                    HStack {
                        Image("small")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width:60, height: 60)
                            .clipped()
                        Text("Milk")
                            .foregroundColor(Color.white)
                        Spacer()
                        Text("Edit")
                            .foregroundColor(Color.white)
                    }
                    Divider()
                    HStack {
                        Image("small")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width:60, height: 60)
                            .clipped()
                        Text("Sugar")
                            .foregroundColor(Color.white)
                        Spacer()
                        Text("Edit")
                            .foregroundColor(Color.white)
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



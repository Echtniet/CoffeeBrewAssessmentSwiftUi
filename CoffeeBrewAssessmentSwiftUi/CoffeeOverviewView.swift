//
//  CoffeeOverviewView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 19/10/2021.
//

import Foundation
import SwiftUI

struct CoffeeOverviewView: View {
    
    @Binding var coffee: Coffee
    @State var coffeeMachine: CoffeeMachine
    @State private var showCoffeeOptions = false
    
    var body: some View {
        HStack {
            Image("small")
                .resizable()
                .clipShape(Circle())
                .frame(width:60, height: 60)
                .clipped()
            Text(self.coffee.name)
                .foregroundColor(Color.white)
            Spacer()
            Text("Edit")
                .foregroundColor(Color.white)
                .onTapGesture {
                    showCoffeeOptions = !showCoffeeOptions
                }
        }
        if showCoffeeOptions{
            ForEach(coffeeMachine.types, id: \._id){ typeCof in
                HStack {
                    Text(typeCof.name)
                        .foregroundColor(Color.white)
                    Spacer()
                    
                }
                .padding(16)
                .background(Color(hex: 0xA0CC8C))
                .cornerRadius(5)
                .onTapGesture {
                    self.coffee = typeCof
                    showCoffeeOptions = !showCoffeeOptions
                }
            }
        }
    }
}

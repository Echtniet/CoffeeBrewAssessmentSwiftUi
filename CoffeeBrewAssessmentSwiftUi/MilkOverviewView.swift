//
//  MilkOverviewView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 19/10/2021.
//

import Foundation
import SwiftUI

struct MilkOverviewView: View {
    
    @ObservedObject var coffeeMac: CoffeeMachineClass
//    @Binding var milk: String
//    @State var coffeeMachine: CoffeeMachine
    @State private var showMilkOptions = false
    @State var selected: String
    
    var body: some View {
        HStack {
            Image("milk")
                .resizable()
                .clipShape(Circle())
                .frame(width:60, height: 60)
                .clipped()
            Text("milk")
                .foregroundColor(Color.white)
            Spacer()
            Text("Edit")
                .foregroundColor(Color.white)
                .onTapGesture {
                    withAnimation{
                        showMilkOptions.toggle()
                    }
                }
        }
        if showMilkOptions{
            RadioButtons(coffeeMac: coffeeMac, selected: self.$selected, milk: 1, subSelections: coffeeMac.extras![1].subselections)
                .onTapGesture {
                    withAnimation{
                        showMilkOptions.toggle()
                    }
            }
            
        }
    }
}

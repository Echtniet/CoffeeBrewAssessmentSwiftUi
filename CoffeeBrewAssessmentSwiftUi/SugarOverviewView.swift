//
//  SugarOverviewView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 19/10/2021.
//

import Foundation
import SwiftUI

struct SugarOverviewView: View {
    @ObservedObject var coffeeMac: CoffeeMachineClass
    @State private var showSugarOptions = false
    @State var selected: String
    
    var body: some View {
        HStack {
            Image("cappuccino")
                .resizable()
                .clipShape(Circle())
                .frame(width:60, height: 60)
                .clipped()
            Text("Sugar")
                .foregroundColor(Color.white)
            Spacer()
            Text("Edit")
                .foregroundColor(Color.white)
                .onTapGesture {
                    withAnimation{
                        showSugarOptions.toggle()
                    }
                }
        }
        if showSugarOptions{
            RadioButtons(coffeeMac: coffeeMac, selected: self.$selected, milk: 0, subSelections: coffeeMac.extras![0].subselections)
                .onTapGesture {
                    withAnimation{
                        showSugarOptions.toggle()
                    }
            }
            
        }
    }
}

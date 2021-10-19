//
//  SugarOverviewView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 19/10/2021.
//

import Foundation
import SwiftUI

struct SugarOverviewView: View {
    
    @Binding var sugar: String
    @State var coffeeMachine: CoffeeMachine
    @State private var showSugarOptions = false
    @State var selected = ""
    
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
                    showSugarOptions = !showSugarOptions
                }
        }
        if showSugarOptions{
            RadioButtons(selected: self.$selected, subSelections: coffeeMachine.extras[0].subselections)
                .onTapGesture {
                    showSugarOptions = !showSugarOptions
            }
            
        }
    }
}

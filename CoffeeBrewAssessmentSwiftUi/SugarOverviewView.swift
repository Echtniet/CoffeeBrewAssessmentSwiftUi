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
            
            ForEach(coffeeMachine.extras[0].subselections, id: \.self){ sub in
                HStack {
                    Text(sub.name)
                        .foregroundColor(Color.white)
                    Spacer()
                    
                }
                .padding(16)
                .background(Color(hex: 0xA0CC8C))
                .cornerRadius(5)
                .onTapGesture {
                    self.sugar = sub.name
                    showSugarOptions = !showSugarOptions
                }
            }
        }
    }
}
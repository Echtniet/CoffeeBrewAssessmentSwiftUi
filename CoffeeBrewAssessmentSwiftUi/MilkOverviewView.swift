//
//  MilkOverviewView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 19/10/2021.
//

import Foundation
import SwiftUI

struct MilkOverviewView: View {
    
    @Binding var milk: String
    @State var coffeeMachine: CoffeeMachine
    @State private var showMilkOptions = false
    
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
                    showMilkOptions = !showMilkOptions
                }
        }
        if showMilkOptions{
            
            ForEach(coffeeMachine.extras[1].subselections, id: \.self){ sub in
                HStack {
                    Text(sub.name)
                        .foregroundColor(Color.white)
                    Spacer()
                    
                }
                .padding(16)
                .background(Color(hex: 0xA0CC8C))
                .cornerRadius(5)
                .onTapGesture {
                    self.milk = sub.name
                    showMilkOptions = !showMilkOptions
                }
            }
        }
    }
}

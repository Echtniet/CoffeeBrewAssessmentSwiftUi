//
//  ExtrasView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 18/10/2021.
//

import Foundation
import SwiftUI

struct ExtrasView: View {
    
    @ObservedObject var coffeeMac: CoffeeMachineClass
    
//    @Binding var coffee: Coffee
//    @State var size: Size
//    @State var milk = "Oat"
//    @State var sugar = "A lot"
//    @State var coffeeMachine: CoffeeMachine
    //let sizes: [Size]
    //let extras: [Extra]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
            }
            Text("Select your extra's")
                .padding(.leading, 20)
                .font(.system(size: 30))
            VStack(alignment: .leading) {
                
                ScrollView(.vertical){
                    ExtraView(coffeeMac: coffeeMac)
                    .cornerRadius(5)
                }
                
                
                Spacer()
                NavigationLink(destination: OverviewView(coffeeMac: coffeeMac)){
                    HStack {

                        Text("Overview")
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 40)
                    .background(Color(hex: 0xAED7A0))
                    .cornerRadius(5)
                }
                
//                ForEach(coffeeMac.coffee.sizes , id: \.self){ size in
//                    SizeView(size: size)
//                        .cornerRadius(5)
//                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            Spacer()
        }
    }
}

//
//  SizeOverviewView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 19/10/2021.
//

import Foundation
import SwiftUI

struct SizeOverviewView: View {
    
    @ObservedObject var coffeeMac: CoffeeMachineClass
    @State private var showSizeOptions = false
    
    var body: some View {
        HStack {
            Image((coffeeMac.size.name != "Large") ? ((coffeeMac.size.name == "Venti") ? "medium" : "small"):"large")
                .resizable()
                .clipShape(Circle())
                .frame(width:60, height: 60)
                .clipped()
            Text(coffeeMac.size.name)
                .foregroundColor(Color.white)
            Spacer()
            Text("Edit")
                .foregroundColor(Color.white)
                .onTapGesture {
                    withAnimation{
                        showSizeOptions.toggle()
                    }
                }
        }
        if showSizeOptions{
            
            ForEach(coffeeMac.coffee.sizes, id: \.self){ typeSize in
                HStack {
                    Text(coffeeMac.sizes![coffeeMac.sizes!.firstIndex(where: {$0._id == typeSize})!].name)
                        .foregroundColor(Color.white)
                    Spacer()
                    
                }
                .padding(16)
                .background(Color(hex: 0xA0CC8C))
                .cornerRadius(5)
                .onTapGesture {
                    coffeeMac.size = coffeeMac.sizes![coffeeMac.sizes!.firstIndex(where: {$0._id == typeSize})!]
                    withAnimation{
                        showSizeOptions.toggle()
                    }
                }
            }
        }
    }
}

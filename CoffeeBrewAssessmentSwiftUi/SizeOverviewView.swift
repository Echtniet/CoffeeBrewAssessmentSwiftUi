//
//  SizeOverviewView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 19/10/2021.
//

import Foundation
import SwiftUI

struct SizeOverviewView: View {
    
    @Binding var size: Size
    @State var coffeeMachine: CoffeeMachine
    @State private var showSizeOptions = false
    
    let sizes: [String]
    
    var body: some View {
        HStack {
            Image("small")
                .resizable()
                .clipShape(Circle())
                .frame(width:60, height: 60)
                .clipped()
            Text(self.size.name)
                .foregroundColor(Color.white)
            Spacer()
            Text("Edit")
                .foregroundColor(Color.white)
                .onTapGesture {
                    showSizeOptions = !showSizeOptions
                }
        }
        if showSizeOptions{
            
            ForEach(sizes, id: \.self){ typeSize in
                HStack {
                    Text(coffeeMachine.sizes[coffeeMachine.sizes.firstIndex(where: {$0._id == typeSize})!].name)
                        .foregroundColor(Color.white)
                    Spacer()
                    
                }
                .padding(16)
                .background(Color(hex: 0xA0CC8C))
                .cornerRadius(5)
                .onTapGesture {
                    self.size = coffeeMachine.sizes[coffeeMachine.sizes.firstIndex(where: {$0._id == typeSize})!]
                    showSizeOptions = !showSizeOptions
                }
            }
        }
    }
}

//
//  ExtraView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 19/10/2021.
//

import Foundation
import SwiftUI

struct ExtraView: View {
    
    @State private var showOptions = false
    @State var selected = ""

    let extra:String
    let subSelections: [SubSelection]
    
    var body: some View {
        VStack {
            HStack {
                Image((extra == "Select the amount of sugar") ? "cappuccino":"milk")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width:60, height: 60)
                    .clipped()
                Text(extra)
                    .foregroundColor(Color.white)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture { showOptions = !showOptions }
            if showOptions {
                Divider()
                    .background(Color.white)
                RadioButtons(selected: self.$selected, subSelections: subSelections)
            }
        }
        .padding(20)
        .background(Color(hex: 0xAED7A0))
       
    }
}



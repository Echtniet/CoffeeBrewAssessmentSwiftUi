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


struct RadioButtons: View {
    @Binding var selected: String
    //@Binding var show: Bool
    
    let subSelections: [SubSelection]
    
    var body: some View {
    
        ForEach(subSelections, id: \.self) { sub in
            Button(action: {
                self.selected = sub.name
            }) {
                HStack {
                    Text(sub.name)
                        .foregroundColor(Color.white)
                    Spacer()
                    
                    ZStack {
                        Circle().stroke().foregroundColor(Color.white).frame(width: 30, height: 30)
                        
                        if self.selected == sub.name {
                            Circle().fill().foregroundColor(Color.white).frame(width: 20, height: 20)
                        }
                    }
                    
                }
                .padding(16)
                .background(Color(hex: 0xA0CC8C))
                .cornerRadius(5)
            }
                
        }
    }
}

//
//  RadioButtonView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 19/10/2021.
//

import Foundation
import SwiftUI

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

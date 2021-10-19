//
//  CoffeeView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 18/10/2021.
//

import Foundation
import SwiftUI

struct CoffeeView: View {
    
    let coffee:Coffee
    
    var body: some View {
        HStack {
            Image((coffee.name != "Ristretto") ? ((coffee.name == "Espresso") ? "expresso" : "cappuccino"):"lungo")
                .resizable()
                .clipShape(Circle())
                .frame(width:60, height: 60)
                .clipped()
            Text(coffee.name)
                .foregroundColor(Color.white)
            Spacer()
        }
        .padding(.leading, 20)
        .padding(.top, 20)
        .padding(.bottom, 20)
        .background(Color(hex: 0xAED7A0))
    }
}

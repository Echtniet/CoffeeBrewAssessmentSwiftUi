//
//  SizeView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 18/10/2021.
//

import Foundation
import SwiftUI

struct SizeView: View {

    let size:String

    var body: some View {
        HStack {
            Image("small")
                .resizable()
                .clipShape(Circle())
                .frame(width:60, height: 60)
                .clipped()
            Text(size)
                .foregroundColor(Color.white)
            Spacer()
        }
        .padding(.leading, 20)
        .padding(.top, 20)
        .padding(.bottom, 20)
        .background(Color(hex: 0xAED7A0))
    }
}

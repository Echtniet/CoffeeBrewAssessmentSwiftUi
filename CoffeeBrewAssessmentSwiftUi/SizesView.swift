//
//  SizesView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 18/10/2021.
//

import Foundation
import SwiftUI

struct SizesView: View {

    let coffee: Coffee
    let sizes: [Size]

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
            }
            Text("Select your size")
                .padding(.leading, 20)
                .font(.system(size: 30))
            VStack(alignment: .leading) {
                ForEach(coffee.sizes, id: \.self) { size in
                    SizeView(size: sizes[sizes.firstIndex(where: {$0._id == size })!].name)
                }
//                ForEach(coffee.sizes , id: \._id){ size in
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

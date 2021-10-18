//
//  ExtrasView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 18/10/2021.
//

import Foundation
import SwiftUI

struct ExtrasView: View {

    let coffee: Coffee
    let sizes: [Size]
    let extras: [Extra]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
            }
            Text("Select your extra's")
                .padding(.leading, 20)
                .font(.system(size: 30))
            VStack(alignment: .leading) {
                ForEach(coffee.extras, id: \.self) { extra in
                    ExtraView(extra: extras[extras.firstIndex(where: {$0._id == extra })!].name, subSelections: extras[extras.firstIndex(where: {$0._id == extra })!].subselections)
                        .cornerRadius(5)
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

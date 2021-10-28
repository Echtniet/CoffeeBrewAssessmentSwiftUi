//
//  SizesView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 18/10/2021.
//

import Foundation
import SwiftUI

struct SizesView: View {
    
    @ObservedObject var coffeeMac: CoffeeMachineClass


    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
            }
            Text("Select your size")
                .padding(.leading, 20)
                .font(.system(size: 30))
            VStack(alignment: .leading) {
                
                ForEach(coffeeMac.coffee.sizes, id: \.self) { size in
                    VStack {
                        NavigationLink(destination: ExtrasView(coffeeMac: coffeeMac)){
                            SizeView(size: coffeeMac.sizes![coffeeMac.sizes!.firstIndex(where: { $0._id == size })!].name
                            )
                            .cornerRadius(5)
                        }
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        coffeeMac.size = coffeeMac.sizes![coffeeMac.sizes!.firstIndex(where: { $0._id == size })!]
                    })
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            Spacer()
        }
    }
}

struct RandoTestView: View {
    var body: some View {
        Text("YES!")
    }
}

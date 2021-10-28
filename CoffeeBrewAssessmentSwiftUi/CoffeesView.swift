//
//  CoffeesView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 18/10/2021.
//

import SwiftUI


struct CoffeesView: View {
    @ObservedObject private var coffeeMac = CoffeeMachineClass()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
            }
            Text("Select your style")
                .padding(.leading, 20)
                .font(.system(size: 30))
            VStack(alignment: .leading) {
                ForEach(coffeeMac.types ?? [], id: \._id){ coffee in
                    VStack {
                        NavigationLink(destination: SizesView(coffeeMac: coffeeMac)
                        ){
                            CoffeeView(coffee: coffee)
                                .cornerRadius(5)
                        }
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        coffeeMac.coffee = coffee
                    })
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            Spacer()
        }
        .onAppear { coffeeMac.loadData()}
        .navigationTitle("Brew with Lex")
        .navigationBarBackButtonHidden(true)
    }
}

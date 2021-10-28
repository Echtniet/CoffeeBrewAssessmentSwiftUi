//
//  CoffeesView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 18/10/2021.
//

import SwiftUI


struct CoffeesView: View {
    @State private var coffeeMachine: CoffeeMachine?
    @State private var coffeeMachineC: CoffeeMachineClass?
    
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
                                        //SizesView(coffee: coffee, sizes: coffeeMachineC?.sizes ?? [], extras: coffeeMachineC?.extras ?? [], coffeeMachine: coffeeMachine!)
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
    
    private func loadData() {
        guard let url = URL(string: "https://darkroastedbeans.coffeeit.nl/coffee-machine/60ba1ab72e35f2d9c786c610") else {
                return
            }
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data else { return }
            if let decodedData = try? JSONDecoder().decode(CoffeeMachine.self, from: data){
                DispatchQueue.main.async {
                    coffeeMachine = decodedData
                    //coffeeMachineC = CoffeeMachineClass(_id: decodedData._id, types: decodedData.types, sizes: decodedData.sizes, extras: decodedData.extras)
                }
            }
        }.resume()

    }
}

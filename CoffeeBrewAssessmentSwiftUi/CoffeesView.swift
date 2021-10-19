//
//  CoffeesView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 18/10/2021.
//

import SwiftUI


struct CoffeesView: View {
    @State private var coffeeMachine: CoffeeMachine?
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
            }
            Text("Select your style")
                .padding(.leading, 20)
                .font(.system(size: 30))
            VStack(alignment: .leading) {
                ForEach(coffeeMachine?.types ?? [], id: \._id){ coffee in
                    NavigationLink(destination: SizesView(coffee: coffee,  sizes: coffeeMachine?.sizes ?? [], extras: coffeeMachine?.extras ?? [], coffeeMachine: self.coffeeMachine!)){
                        CoffeeView(coffee: coffee)
                            .cornerRadius(5)
                    }
                    
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            Spacer()
        }
        .onAppear(perform: loadData)
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
                    self.coffeeMachine = decodedData
                }
            }
        }.resume()

    }
}

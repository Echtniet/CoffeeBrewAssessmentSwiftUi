//
//  ContentView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Clinton Davelaar on 18/10/2021.
//

import SwiftUI
import Combine

struct SubSelection: Decodable {
    let _id: String
    var name: String
}

struct Extra: Decodable {
    let _id: String
    var name: String
    var subselections: [SubSelection]
    
}

struct Size: Decodable {
    let _id: String
    var name: String
}

struct Coffee: Decodable {
    let _id: String
    var name: String
    var sizes: [String]
    var extras: [String]
}

struct CoffeeMachine: Decodable {
    let _id: String
    var types: [Coffee]
    var sizes: [Size]
    var extras: [Extra]
}



struct ContentView: View {
    
    @State private var coffeeMachine: CoffeeMachine?
    
    var body: some View {
        HStack{
            Text(coffeeMachine?.extras[1].name ?? "")
        }.onAppear(perform: loadData)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


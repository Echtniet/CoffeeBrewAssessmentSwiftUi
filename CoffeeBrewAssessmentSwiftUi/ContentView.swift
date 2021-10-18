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
        HomeView()
    }
}

struct CoffeeView: View {
    
    let coffee:Coffee
    
    var body: some View {
        HStack {
            Image("lungo")
                .resizable()
                .clipShape(Circle())
                .frame(width:60, height: 60)
                .clipped()
            Text(coffee.name)
            Spacer()
        }
        .padding(.leading, 20)
        .padding(.top, 20)
        .padding(.bottom, 20)
        .background(Color(hex: 0xAED7A0))
    }
}

struct HomeView: View {
    var body: some View{
        NavigationView {
            VStack(alignment: .leading) {
                Text("Tab the machine to start")
                    .padding(.leading, 20)
                    .font(.system(size: 30))
                Spacer()
                NavigationLink(destination: CoffeesView()){
                    Image("home")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Spacer()
                Text("How does this work?")
                    .underline()
                    .padding(.leading, 20)
            }
            .navigationBarTitle(Text("Dark Roasted Beans"))
        }
    }
}

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
                    CoffeeView(coffee: coffee)
                        .cornerRadius(5)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

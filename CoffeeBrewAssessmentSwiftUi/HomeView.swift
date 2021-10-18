//
//  HomeView.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 18/10/2021.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    init() {
        UINavigationBar.appearance().tintColor = .black
    }
    
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
            //.navigationBarItems(leading: backButton)
        }
    }
}

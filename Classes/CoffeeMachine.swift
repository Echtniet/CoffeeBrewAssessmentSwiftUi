//
//  CoffeeMachine.swift
//  CoffeeBrewAssessmentSwiftUi
//
//  Created by Danae Davelaar on 28/10/2021.
//

import Foundation
import SwiftUI
import Combine

class CoffeeMachineClass: ObservableObject {
    private var _id: String? = nil
    @Published var types: [Coffee]? = nil
    @Published var sizes: [Size]? = nil
    @Published var extras: [Extra]? = nil
    @Published private var _coffee: Coffee?
    @Published private var _size: Size?
    @Published private var _sugar: SubSelection?
    @Published private var _milk: SubSelection?
    @Published var selectedCoffee = ""
    @Published var selectedMilk = ""
    
    var id: String {
        get { return _id! }
    }
    
    var coffee: Coffee {
        set {
            _coffee = newValue
        }
        get {
            return _coffee!
        }
    }
    
    var size: Size {
        set {
            _size = newValue
        }
        get {
            return _size!
        }
    }
    
    var sugar: SubSelection {
        set {
            _sugar = newValue
        }
        get {
            return _sugar!
        }
    }
    
    var milk: SubSelection {
        set {
            _milk = newValue
        }
        get {
            return _milk!
        }
    }
}

extension CoffeeMachineClass {
    func loadData() {
        guard let url = URL(string: "https://darkroastedbeans.coffeeit.nl/coffee-machine/60ba1ab72e35f2d9c786c610") else {
                return
            }
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data else { return }
            if let decodedData = try? JSONDecoder().decode(CoffeeMachine.self, from: data){
                DispatchQueue.main.async {
                    self._id = decodedData._id
                    self.types = decodedData.types
                    self.sizes = decodedData.sizes
                    self.extras = decodedData.extras
                }
            }
        }.resume()
    }
}

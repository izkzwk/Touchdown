//
//  Shop.swift
//  Touchdown
//
//  Created by Dzmitry Bladyka on 3.04.23.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct = false
    @Published var selectedProduct: Product? = nil
}

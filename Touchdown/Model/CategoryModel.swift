//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Dzmitry Bladyka on 3.04.23.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}

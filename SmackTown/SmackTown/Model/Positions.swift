//
//  Positions.swift
//  SmackTown
//
//  Created by Denis Ivaschenko on 10.12.2024.
//

import Foundation

struct Positions {
    var id: String
    var product: Product
    var count: Int
    var cost: Int {
        return product.price * self.count
    }
}

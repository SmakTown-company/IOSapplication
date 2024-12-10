//
//  ProductDetailViewModel.swift
//  SmackTown
//
//  Created by Denis Ivaschenko on 08.12.2024.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    //публикуемое свойство
    @Published var product: Product
    @Published var count = 0
    
    init(product: Product) {
        self.product = product
    }
}

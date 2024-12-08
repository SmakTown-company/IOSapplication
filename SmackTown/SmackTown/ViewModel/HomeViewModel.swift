//
//  HomeViewModel.swift
//  SmackTown
//
//  Created by Denis Ivaschenko on 08.12.2024.
//


import Foundation


class HomeViewModel:ObservableObject {
    static let shared = HomeViewModel()
    
    var products = [
        Product(id: "1", title: "Кока Кола 0.5", imageUrl: "Not Found", price: 150, sale: 100, category_id: "water", shop: "ПУД", percentOfSale: -33),
        Product(id: "2", title: "Кока Кола 0.5", imageUrl: "Not Found", price: 150, sale: 100, category_id: "water", shop: "ПУД", percentOfSale: -33),
        Product(id: "3", title: "Кока Кола 0.5", imageUrl: "Not Found", price: 150, sale: 100, category_id: "water", shop: "ПУД", percentOfSale: -33),
        Product(id: "4", title: "Кока Кола 0.5", imageUrl: "Not Found", price: 150, sale: 100, category_id: "water", shop: "ПУД", percentOfSale: -33)
    ]
    
}

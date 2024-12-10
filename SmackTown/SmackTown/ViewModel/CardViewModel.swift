//
//  CardViewModel.swift
//  SmackTown
//
//  Created by Denis Ivaschenko on 10.12.2024.
//

import Foundation
class CardViewModel: ObservableObject {
    @Published var positions = [Positions]()
    
    var cost: Int {
        var sum = 0
        
        for position in positions {
            sum += position.cost
        }
        
        return sum
    }
    
    func addPosition(_ position: Positions) {
        self.positions.append(position)
    }
}

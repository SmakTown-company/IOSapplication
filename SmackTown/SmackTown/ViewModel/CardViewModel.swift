//
//  CardViewModel.swift
//  SmackTown
//
//  Created by Denis Ivaschenko on 10.12.2024.
//

import Foundation
class CardViewModel: ObservableObject {
    @Published var positions = [Positions]()
    
    func addPosition(_ position: Positions) {
        self.positions.append(position)
    }
}

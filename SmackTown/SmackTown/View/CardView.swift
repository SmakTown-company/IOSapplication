//
//  CardView.swift
//  SmackTown
//
//  Created by Denis Ivaschenko on 10.12.2024.
//

import SwiftUI

struct CardView: View {
    
    var viewModel: CardViewModel
    
    var body: some View {
        
        VStack {
            List(viewModel.positions) { position in
                PositionCell(positiopn: position)
                
            }.listStyle(.plain)
                .navigationTitle("Корзина")
            
            HStack {
                Text("Итого:")
                Spacer()
                Text("38383")
            }.padding()
        }
    }
}
#Preview {
    CardView(viewModel:CardViewModel())
}

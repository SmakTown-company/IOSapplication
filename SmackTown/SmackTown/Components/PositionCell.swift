//
//  PositionCell.swift
//  SmackTown
//
//  Created by Denis Ivaschenko on 11.12.2024.
//

import SwiftUI

struct PositionCell: View {
    
    let positiopn: Positions
    
    var body: some View {
        HStack {
            
      
            Text(positiopn.product.title)
            Spacer()
            Text("\(positiopn.cost) ₽")
            Text("\(positiopn.count) шт.")
            
            Text(positiopn.product.shop)
                .frame(width:50, alignment: .trailing)
        }.padding(.horizontal)
    }
}

#Preview {
    PositionCell(positiopn: Positions(id: UUID().uuidString, product: Product(id: UUID().uuidString, title: "Кока Кола 0.5", imageUrl: "cocacola", price: 150, sale: 100, category_id: "water", shop: "ПУД", percentOfSale: -33, descript: "Кока-Кола — это не просто газировка, это настоящая традиция, которая сопровождает нас в самых важных моментах жизни. Будь то встреча с друзьями, семейный ужин или просто время для отдыха, Кока-Кола всегда поддержит вас своим освежающим вкусом."), count: 3))
}

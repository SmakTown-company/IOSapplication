//
//  ProfileView.swift
//  SmackTown
//
//  Created by Denis Ivaschenko on 07.12.2024.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    
    var body: some View {
        VStack {
            Image("cocacola").resizable()
            Text("\(product.title)").font(.custom("Montserrat-Regular", size: 20))
            HStack {
                
                Text("\(product.sale ?? 0)₽").font(.custom("Montserrat-Bold", size: 20))
                Text("\(product.price) ₽").font(.custom("Montserrat-Regular", size: 15))
                    .strikethrough(true, color: .gray)
                Text("\(product.percentOfSale ?? 0) %").foregroundColor(.red)
                    .font(.custom("Monstreat-Regular", size: 15))
                
                
                
                
                
            }
            
            Text("\(product.shop)")
                .font(.custom("Montserrat-Regular", size: 15))
            
        }.frame(width:screen.width*0.45, height: screen.height*0.35)
    }
}
#Preview {
    ProductCell(product: Product(id: "1", title: "Coca Cola", imageUrl: "Not Found", price: 150, sale: 100, category_id: "water", shop: "ПУД", percentOfSale: -33))
}

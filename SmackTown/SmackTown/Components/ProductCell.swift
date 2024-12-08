//
//  ProfileView.swift
//  SmackTown
//
//  Created by Denis Ivaschenko on 07.12.2024.
//

import SwiftUI

struct ProductCell: View {
    @State var tapOn: Bool = false
    
    var product: Product
    
    var body: some View {
        VStack(spacing:6) {
            Image("cocacola").resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
                .cornerRadius(16)
            Text("\(product.title)").font(.custom("Montserrat-Regular", size: 20))
                .padding(2)
                .foregroundColor(.white)
            HStack {
                
                Text("\(product.sale ?? 0)₽").font(.custom("Montserrat-Bold", size: 20))
                    .foregroundColor(.white)
                Text("\(product.price) ₽").font(.custom("Montserrat-Regular", size: 15))
                    .strikethrough(true, color: .gray)
                    .foregroundColor(.white)
                Text("\(product.percentOfSale ?? 0) %").foregroundColor(.red)
                    .font(.custom("Monstreat-Regular", size: 15))
                
                
                
                
                
                
            }
            Button {
                tapOn = true
            } label: {
                Text("В КОРЗИНУ")
                    .font(.custom("Montserrat-Bold", size: 18)) // Увеличиваем шрифт текста кнопки
                    .foregroundColor(.white) // Цвет текста
                    .padding() // Добавляем внутренние отступы
                    .frame(width: 150, height: 50) // Задаем размер кнопки
                    .background(Color("orange", bundle: nil)) // Задаем цвет фона
                    .cornerRadius(10) // Скругляем углы кнопки
            }

            
            Text("\(product.shop)")
                .font(.custom("Montserrat-Regular", size: 15))
                .foregroundColor(.white)
            
        }.frame(width:screen.width*0.45, height: screen.height*0.40)
            .shadow(radius:4)
            .padding()
    }
}
#Preview {
    ProductCell(product: Product(id: "1", title: "Кока Кола 0.5", imageUrl: "Not Found", price: 150, sale: 100, category_id: "water", shop: "ПУД", percentOfSale: -33))
}

//
//  HomeView.swift
//  SmackTown
//
//  Created by Denis Ivaschenko on 07.12.2024.
//

import SwiftUI

struct HomeView : View {
    
    @State private var searchText: String =  ""
    
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    
    // Фильтруем продукты в зависимости от поискового запроса
       var filteredProducts: [Product] {
           if searchText.isEmpty {
               return HomeViewModel.shared.products // Если запрос пуст, возвращаем все продукты
           } else {
               return HomeViewModel.shared.products.filter { product in
                   product.title.lowercased().contains(searchText.lowercased()) // Фильтрация
               }
           }
       }
    
    var body: some View {
        ZStack {
            Color("back", bundle: nil).ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                
            
                TextField("Поиск...", text: $searchText)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Color("orange", bundle: nil).opacity(0.9))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .font(.custom("Montserrat-Bold", size: 20))
                    .padding(.top, 20) // Убираем верхний отступ
                    .padding(.bottom, -10) // Добавляем отступ снизу, чтобы поисковик был ближе к нижним элементам
                
                Section("") {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: layout, spacing:12) {
                            ForEach(HomeViewModel.shared.products, id: \.id) {
                                item in ProductCell(product: item)
                            }
                        }.padding()
                    }
                }
            }
        
        }
    }
}


#Preview {
    HomeView()
}

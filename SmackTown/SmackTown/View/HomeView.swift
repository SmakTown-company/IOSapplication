import SwiftUI

struct HomeView: View {
    
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
        NavigationView { // Добавляем NavigationView
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
                        .padding(.top, 20)
                        .padding(.bottom, -10)
                    
                    Section("") {
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVGrid(columns: layout, spacing: 12) {
                                ForEach(filteredProducts, id: \.id) { item in
                                    NavigationLink {
                                        ProductDetailView(viewModel: ProductDetailViewModel(product: item))
                                    } label: {
                                        ProductCell(product: item)
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

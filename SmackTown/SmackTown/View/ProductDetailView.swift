import SwiftUI

struct ProductDetailView: View {
    @State private var tapOn = false
    @State private var count = 1
    var viewModel: ProductDetailViewModel
    
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        
        // Настройка внешнего вида навигационного бара
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() // Используем непрозрачный фон
        appearance.backgroundColor = UIColor(named: "back") // Устанавливаем цвет фона
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // Устанавливаем цвет текста
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white] // Устанавливаем цвет текста для большого заголовка
        
        // Применяем настройки
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        ZStack {
            Color("back", bundle: nil).ignoresSafeArea()
            ScrollView { // Добавляем ScrollView
                VStack {
                    Image("cocacola")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: screen.width * 0.6)
                        .clipped()
                        .cornerRadius(16)
                        .padding(.top, 20)
                    
                    HStack {
                        Text("\(viewModel.product.sale ?? 0)₽")
                            .font(.custom("Montserrat-Bold", size: 20))
                            .foregroundColor(.white)
                        
                        Text("\(viewModel.product.price) ₽")
                            .font(.custom("Montserrat-Regular", size: 18))
                            .strikethrough(true, color: .gray)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("\(viewModel.product.percentOfSale ?? 0) %")
                            .foregroundColor(.red)
                            .font(.custom("Monstreat-Regular", size: 20))
                    }
                    .padding(.top, 10)
                    .padding(.horizontal, 40)
                    
                    HStack {
                        Text("\(viewModel.product.shop)")
                            .font(.custom("Montserrat-Bold", size: 15))
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 40)
                    
                    HStack {
                        Text("\(viewModel.product.title)")
                            .font(.custom("Montserrat-Bold", size: 20))
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 2)
                    
                    // Добавляем описание продукта
                    Text(viewModel.product.descript ?? "Описание отсутствует")
                        .font(.custom("Montserrat-Regular", size: 20))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding(.horizontal, 40)
                        .padding(.top, 2)
                    
                    // Последний HStack с Stepper, Text и Button
                    HStack {
                        Stepper("", value: $count, in: 1...10000)
                            // Отступ между Stepper и Text
                        
                        Text("\(self.count)")
                            .font(.custom("Montserrat-Regular", size: 18))
                            .foregroundColor(.white)
                            .padding(.trailing, 40) 
                        
                        Spacer() // Пробел между Text и Button
                        
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
                    }
                    .padding(.horizontal, 40) // Добавляем горизонтальный отступ для HStack
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "1", title: "Кока Кола 0.5", imageUrl: "Not Found", price: 150, sale: 100, category_id: "water", shop: "ПУД", percentOfSale: -33, descript: "Кока-Кола — это не просто газировка, это настоящая традиция, которая сопровождает нас в самых важных моментах жизни. Будь то встреча с друзьями, семейный ужин или просто время для отдыха, Кока-Кола всегда поддержит вас своим освежающим вкусом.")))
    }
}

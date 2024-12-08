import SwiftUI

struct ContentView: View {
    init() {
        // Создаем объект appearance для настройки TabBar
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground() // Отключаем прозрачность
        appearance.backgroundColor = UIColor(named: "back") // Устанавливаем цвет фона TabBar

        // Применяем appearance для TabBar
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        ZStack {
            Color("back", bundle: nil).ignoresSafeArea() // Фон всей области

            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Главная")
                    }
                    .tag(0)

                BasketView()
                    .tabItem {
                        Image(systemName: "basket.fill")
                        Text("Корзина")
                    }
                    .tag(1)

                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Профиль")
                    }
                    .tag(2)
            }
            .accentColor(Color("orange", bundle: nil)) // Цвет выбранной вкладки
        }
    }
}

#Preview {
    ContentView()
}

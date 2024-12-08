//
//  ContentView.swift
//  SmackTown
//
//  Created by Denis Ivaschenko on 07.12.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("back", bundle: nil).ignoresSafeArea()
            
            VStack {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Главная")
                        }
                        .tag(0)
                    
                    BasketView() .tabItem {
                        Image(systemName: "basket.fill")
                        Text("Корзина")
                    }.tag(1)
                    
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Профиль")
                        }
                        .tag(2)
                }
                .accentColor(Color("orange", bundle: nil) )// Цвет выбранной вкладки
                .onAppear {
                    UITabBar.appearance().backgroundColor = UIColor(named:"backTab") // Цвет фона TabBar
                                        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

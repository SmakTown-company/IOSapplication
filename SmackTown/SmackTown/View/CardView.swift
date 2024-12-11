import SwiftUI

struct CardView: View {
    
    @StateObject var viewModel: CardViewModel
    
    var body: some View {
        ZStack {
            Color("back", bundle: nil).ignoresSafeArea()
            
            VStack {
                // Список позиций
                List(viewModel.positions) { position in
                    PositionCell(positiopn: position)
                    
                        .swipeActions {
                            Button {
                                viewModel.positions.removeAll {
                                    pos in
                                    pos.id == position.id
                                }
                            } label: {
                                Text("Удалить")
                            }.tint(.red)

                    }
                }
                .listStyle(.plain)
                .navigationTitle("Корзина")
                
                Spacer() // Растягиваем список вверх, чтобы кнопки были внизу
                
                // Итоговая сумма
                HStack {
                    Text("Итого:")
                        .font(.custom("Montserrat-Bold", size: 20))
                        .foregroundColor(.white)
                    Spacer()
                    Text("\(viewModel.cost) ₽")
                        .font(.custom("Montserrat-Bold", size: 20))
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color("buttonCount", bundle: nil))
                .cornerRadius(10)
                
                // Кнопки "Отменить" и "Заказать"
                HStack(spacing: 24) {
                    Button {
                        print("Отменить")
                    } label: {
                        Text("Отменить")
                            .font(.custom("Montserrat-Bold", size: 20))
                            .foregroundColor(.white)
                            .frame(width: 180, height: 60) // Задаем размер
                            .background(Color("cancellationButton", bundle: nil))
                            .cornerRadius(24)
                    }
                    
                    Button {
                        print("Заказать")
                    } label: {
                        Text("Заказать")
                            .font(.custom("Montserrat-Bold", size: 20))
                            .foregroundColor(.white)
                            .frame(width: 180, height: 60) // Задаем размер
                            .background(Color("orderButton", bundle: nil))
                            .cornerRadius(24)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 16) // Добавляем отступ снизу, чтобы кнопки не прилипали к краю
            }
        }
    }
}

#Preview {
    CardView(viewModel: CardViewModel.shared)
}

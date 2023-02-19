//
//  WeatherView.swift
//  WeatherWithSwiftUIExample
//
//  Created by Leo Ho on 2022/4/22.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var selectedIndex = 0
    
    @State private var alertMessage: String = ""
    
    @State private var isPresentAlert: Bool = false
    
    @StateObject private var vm = WeatherViewModel()
    
    var body: some View {
        VStack {
            Text(WeatherViewModel.City.allCases[selectedIndex].title)
                .minimumScaleFactor(0.5)
                .padding()
            
            Picker(selection: $selectedIndex) {
                ForEach(WeatherViewModel.City.allCases) { city in
                    Text(city.title).tag(city.id)
                }
            } label: {
                Text("請選擇要查詢天氣的城市")
            }.padding()
                .onChange(of: selectedIndex) { newValue in
                    selectedIndex = newValue
                }
            
            Button {
                isPresentAlert.toggle()
                Task {
                    let city = WeatherViewModel.City.allCases[selectedIndex].url
                    print(city)
                    await vm.getWeatherData(city: city)
                }
            } label: {
                Label("開始查詢", systemImage: "magnifyingglass.circle.fill")
            }
            .padding()
            .foregroundColor(.white)
            .background(.red)
            .cornerRadius(40)
            .alert(Text(vm.message), isPresented: $isPresentAlert) {
                Button("關閉") {}
            }
        }
        .onChange(of: vm.message) { newValue in
            print(newValue)
            alertMessage = newValue
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

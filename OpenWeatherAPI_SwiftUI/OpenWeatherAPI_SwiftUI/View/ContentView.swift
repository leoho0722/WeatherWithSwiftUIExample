//
//  ContentView.swift
//  OpenWeatherAPI_SwiftUI
//
//  Created by Leo Ho on 2022/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedIndex = 0
    
    var weatherDataViewModel = WeatherAPIViewModel()
    
    var body: some View {
        VStack {
            Text(selectedIndex == 0 ? "Please select the city you want to query" : weatherDataViewModel.cityList[selectedIndex])
                .minimumScaleFactor(0.5)
                .padding()
            
            Picker(selection: $selectedIndex) {
                ForEach(weatherDataViewModel.cityList.indices) { index in
                    Text(weatherDataViewModel.cityList[index])
                }
            } label: {
                Text("Choose City")
            }.padding()
            
            Button(action: {
                
            }) {
                HStack {
                    Image(systemName: "magnifyingglass.circle.fill")
                    Text("Search")
                }.font(.title)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

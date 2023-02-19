//
//  WeatherViewModel.swift
//  WeatherWithSwiftUIExample
//
//  Created by Leo Ho on 2022/4/22.
//  Copyright © 2022 Leo Ho. All rights reserved.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
            
    @Published var message: String = ""
    
    enum City: Int, CaseIterable, Identifiable {
        case none = 0, Taipei, NewTaipei, Taoyuan, Taichung, Tainan, Kaohsiung, NewYork
        
        var id: Int { self.rawValue }
        
        var title: String {
            switch self {
            case .none: return "尚未選擇城市"
            case .Taipei: return "台北市"
            case .NewTaipei: return "新北市"
            case .Taoyuan: return "桃園市"
            case .Taichung: return "台中市"
            case .Tainan: return "台南市"
            case .Kaohsiung: return "高雄市"
            case .NewYork: return "紐約"
            }
        }
        
        var url: String {
            switch self {
            case .none: return "尚未選擇城市"
            case .Taipei: return "Taipei"
            case .NewTaipei: return "New%20Taipei"
            case .Taoyuan: return "Taoyuan"
            case .Taichung: return "Taichung"
            case .Tainan: return "Tainan"
            case .Kaohsiung: return "Kaohsiung"
            case .NewYork: return "New%20York"
            }
        }
    }
    
    func getWeatherData(city: String) async {
        print("123", city)
        do {
            let response: WeatherData = try await NetworkManager.shared.requestData(city: city)
            
            let (lon, lat) = (response.coord.lon, response.coord.lat)
            let temp = response.main.temp
            let city = response.name
            
            await MainActor.run {
                message = "城市名稱：\(city)\n經度：\(lon)\n緯度：\(lat)\n溫度：\(temp) 度"
            }
        } catch {
            message = error.localizedDescription
        }
    }
}

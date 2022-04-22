//
//  WeatherAPIViewModel.swift
//  OpenWeatherAPI_SwiftUI
//
//  Created by Leo Ho on 2022/4/22.
//  Copyright © 2022 Leo Ho. All rights reserved.
//

import Foundation

class WeatherAPIViewModel {
    
    let cityList = ["Choose City", "Taipei", "New Taipei", "Taoyuan", "Taichung", "Tainan", "Kaohsiung", "New York"]
    
    let cityListURL = ["Taipei", "New%20Taipei", "Taoyuan", "Taichung", "Tainan", "Kaohsiung", "New%20York"]
    
    // 將 URL 支援的格式轉為常見的名稱
    func cityNameURLFormatter(city: String) -> String {
        switch city {
        case "Taipei": return "Taipei"
        case "New%20Taipei": return "New Taipei"
        case "Taoyuan": return "Taoyuan"
        case "Taichung": return "Taichung"
        case "Tainan": return "Tainan"
        case "Kaohsiung": return "Kaohsiung"
        case "New%20York": return "New York"
        default: return "No city has been selected"
        }
    }
    
}

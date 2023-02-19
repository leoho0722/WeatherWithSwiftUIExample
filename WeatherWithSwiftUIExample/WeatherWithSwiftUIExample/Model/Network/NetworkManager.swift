//
//  NetworkManager.swift
//  WeatherWithSwiftUIExample
//
//  Created by Leo Ho on 2022/4/22.
//  Copyright © 2022 Leo Ho. All rights reserved.
//

import Foundation

class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    
    /// 請求資料
    /// - Parameters:
    ///   - city: String，要查詢天氣的城市
    func requestData<D>(city: String) async throws -> D where D: Decodable {
        let baseUrl = NetworkConstants.baseUrl
        let path = ApiPathConstants.weather.rawValue
        let apiKey = NetworkConstants.apiKey
                
        guard let url = URL(string: baseUrl + path + "q=\(city)" + "&appid=" + apiKey) else {
            throw RequestError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
              (200 ... 299).contains(statusCode) else {
            throw RequestError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        guard let results = try? decoder.decode(D.self, from: data) else {
            throw RequestError.jsonDecodeFailed
        }
        
        return results
    }
}

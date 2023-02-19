//
//  NetworkConstants.swift
//  TekPass Keep
//
//  Created by 呂淳昇 on 2022/10/14.
//

import Foundation

struct NetworkConstants {
    
    static let baseUrl = "https://"
    
    static let apiKey = "62ef5eba4eeb4662491645f8f68cc219"
    
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case userKey = "User-Key"
    }
    
    enum ContentType: String {
        case json = "application/json"
        case xml = "application/xml"
        case textPlain = "text/plain"
        case x_www_form_urlencoded = "application/x-www-form-urlencoded"
    }
}

enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

enum RequestError: Error {
    case unknownError
    case connectionError
    case authorizationError
    case invalidRequest
    case notFound
    case invalidURL
    case invalidResponse
    case serverError
    case serverUnavailable
    case internalError
    case badGateway
    case jsonDecodeFailed
}

enum ApiPathConstants: String {
    
    case weather = "api.openweathermap.org/data/2.5/weather?"
}

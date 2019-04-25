//
//  Endpoint.swift
//  Weather_app
//
//  Created by Mehtab Singh Sidhu on 2/12/19.
//  Copyright © 2019 Mehtab Singh Sidhu. All rights reserved.
//

// we construct the endpoint for the json response

import Foundation

protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    
    // specify parameters to the endpoint of the url
    //var queryItems: [URLQueryItem] { get }
    
}

extension Endpoint {
    
    var urlComponent: URLComponents {
        var component = URLComponents(string: baseUrl)
        component?.path = path
        //component?.queryItems = queryItems
        
        return component!
    }
    
    var request: URLRequest {
        return URLRequest(url: urlComponent.url!)
    }
    
    
}

enum WeatherEndpoint: Endpoint {
    
    case currentForecast(latitude: String, longitude: String)
    
    // to get weeks forecast
    //case week_forecast(latitude: String, longitude: String)
    var baseUrl: String {
        return "https://api.darksky.net"
    }
    var path: String {
        switch self {
        case .currentForecast(let latitude, let longitude):
            return "/forecast/ef4b80a7e748b0fdf719d719becff381/\(latitude),\(longitude)"
            
        }
    }
    
    //var queryItems: [URLQueryItem] {
    //    return []
    //}
    
}

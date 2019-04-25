//
//  weather.swift
//  Weather_app
//
//  Created by Mehtab Singh Sidhu on 2/12/19.
//  Copyright © 2019 Mehtab Singh Sidhu. All rights reserved.
//

// our structure to model the weather response
// we get from the Dark Sky API
import Foundation

class Weather: Codable {
    let currently: DSCurrent
    
    //try getting forecast for the entire week
    let daily: daily_fcast
    
    //private enum CodingKeys: String, CodingKey {
    //    case current = "currently"
    //}
    
}

struct DSCurrent: Codable {
    let summary: String
    let temperature: Double
//    private enum CodingKeys: String, CodingKey {
//        case temp = "temperature"
//    }
}

struct daily_fcast: Codable {
    let summary: String
    // data is an array containing weeks forecast
    let data: [day_forecast]
}

struct day_forecast: Codable {
    let summary: String
    let temperatureHigh: Double
    let temperatureLow: Double
}

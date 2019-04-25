//
//  weatherAPIClient.swift
//  Weather_app
//
//  Created by Mehtab Singh Sidhu on 2/12/19.
//  Copyright © 2019 Mehtab Singh Sidhu. All rights reserved.
//

import Foundation

class WeatherAPIClient: APIClient {
    var session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    
    func weather_current(with endpoint: WeatherEndpoint, completion: @escaping (Either<DSCurrent, APIError>) -> Void) {
        let request = endpoint.request
        self.fetch(with: request) { (either: Either<Weather, APIError>) in
            switch either {
            case .value(let weather):
                let curr_weather = weather.currently
                completion(.value(curr_weather))
                
            case .error(let error):
                completion(.error(error))
                
            }
        }
    }
   
    
    func weather(with endpoint: WeatherEndpoint, completion: @escaping (Either<daily_fcast, APIError>) -> Void) {
        let request = endpoint.request
        self.fetch(with: request) { (either: Either<Weather, APIError>) in
            switch either {
            case .value(let weather):
                //let textForecast = weather.currently.temp
                //completion(.value(textForecast))
                let week_weather = weather.daily
                completion(.value(week_weather))
            case .error(let error):
                completion(.error(error))
                
            }
        }
    }
    
}

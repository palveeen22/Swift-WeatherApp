//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Alvin Putra Pratama on 22/04/24.
//

import Foundation
import CoreLocation


// Get data Weather
class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) async throws -> ResponseBody {
        
        let KEY_API = "4fffedfe2d7b05fd10607b0a8babc2d5"
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longtitude)&appid=\(KEY_API)&units=metric") else {fatalError("Missing URL")}
        
        let urlReq = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlReq)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error fetching data")}
        
        let decodeData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodeData
    }
}
 

// Model of the response body we get from calling the OpenWeather API
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}

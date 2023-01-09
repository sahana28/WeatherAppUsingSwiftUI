//
//  WeatherAPIService.swift
//  WeatherAppUsingSwiftUI
//
//  Created by Sahana  Rao on 07/01/23.
//

import Foundation
import CoreLocation


class WeatherAPIService  {
    
    
    func getWeatherForecast(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody{
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=2685ed1a2d02849950a319e135d6a06b&units=metric") else { fatalError("Missing Url") }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error fetching weather response")}
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        return decodedData
            
    }
}

//
//  WeatherManager.swift
//  Clima
//
//  Created by JSworkstation on 2020/06/16.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, _ weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager {
    let url = "https://api.openweathermap.org/data/2.5/weather?appid=0682fa1bceaa81a0aa1c1f730026de92&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(_ cityName: String) {
        let urlString = "\(url)&q=\(cityName)"
        performRequest(urlString)
    }
    
    func fetchWeather(_ latitude: Double, _ longitude: Double) {
        let urlString = "\(url)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString)
    }
    
    func performRequest(_ urlString: String) {
        //1. Create a URL
        
        guard let url = URL(string: urlString) else {
            print("Error : url optional can't remove")
            return
        }
        
        //2. Create a URLSession
        let session = URLSession(configuration: .default)
        
        //3. Give the session a task
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                self.delegate?.didFailWithError(error!)
                return
                
            }
            
            guard let safeData = data else { return }
            let weather = self.parseJSON(safeData)
            self.delegate?.didUpdateWeather(self, weather!)
            
        }
        //4. Start the task
        task.resume()
    }
    
    func parseJSON(_ safeData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let jsonData = try decoder.decode(WeatherData.self, from: safeData)
            let id = jsonData.weather[0].id
            let temp = jsonData.main.temp
            let name = jsonData.name
            
            let weather = WeatherModel(conditionID: id, temperature: temp, cityName: name)
            return weather
            
        } catch let jsonErr {
            print("something wrong after downloaded: \(jsonErr)")
            return nil
        }
    }
}


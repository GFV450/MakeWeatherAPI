//
//  OpenWeatherMapAPI.swift
//  OpenWeatherMapAPI-starter
//
//  Created by Nikolas Burk on 28/09/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import Foundation

class OpenWeatherMapAPI {
  
    
    func requestCurrentWeather(city: String, callback: @escaping (Any) -> Void )
  {
    
    let urlString: String = "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=76206cd3a7796e7db880c8385c0786ef"
    let session: URLSession = URLSession.shared
    let url = URL(string: urlString)
    
    let task = session.dataTask(with: url!, completionHandler: { data, response, error -> Void in
      if let actualData = data {
        //        let dataString = String(data: actualData, encoding: String.Encoding.utf8)
        let json = try! JSONSerialization.jsonObject(with: actualData) as! [String: Any]
        print("received OpenWeatherMapAPI json: \(json)")
        callback(json)
      }
      else {
        print("no data received: \(error)")
      }
      
    })
    task.resume()
  }
}

//
//  ViewController.swift
//  OpenWeatherMapAPI-starter
//
//  Created by Nikolas Burk on 28/09/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBAction func goButtonPressed(_ sender: AnyObject) {
        let city = cityTextField.text
        
        openWeatherMapAPI.requestCurrentWeather(buttonPressed: "weather", city: city!, callback: { (json: Any) -> Void in
                //Description cast
                let dict = json as! NSDictionary
                let cityWeatherArray = dict["weather"] as! NSArray
                let cityWeatherDict = cityWeatherArray[0] as! NSDictionary
                let description = cityWeatherDict["description"] as! String
                
                //Temperature cast
                let cityMain = dict["main"] as! NSDictionary
                
                
                let minTemp = cityMain["temp_min"]
                let maxTemp = cityMain["temp_min"]
                
                //Label setting
                self.descriptionLabel.text = "Description: \(description)"
                self.minTempLabel.text = "Min: \(minTemp)"
                self.maxTempLabel.text = "Max: \(maxTemp)"
            })
    }
    
    @IBAction func forecastButtonPressed(_ sender: AnyObject) {
        let city = cityTextField.text
        
        openWeatherMapAPI.requestCurrentWeather(buttonPressed: "forecast", city: city!, callback: { (json: Any) -> Void in
            //access the Array for the daily forecasts
            let dict = json as! NSDictionary
            let forecastArray = dict["list"] as! NSArray
            let forecastDayOne = forecastArray[0] as! NSDictionary
            
            //retrieves forecast date
            let forecastDate = forecastDayOne["dt_txt"]
            
            //retrieves forecast temperature
            let tempDict = forecastDayOne["main"] as! NSDictionary
            let forecastTemp = tempDict["temp"]
            
            //retreives forecast description
            let descriptionArray = forecastDayOne["weather"] as! NSArray
            let descriptionDict = descriptionArray[0] as! NSDictionary
            let description = descriptionDict["description"]
        })
    }
    
  let openWeatherMapAPI = OpenWeatherMapAPI()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}


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
        
            openWeatherMapAPI.requestCurrentWeather(city: city!, callback: { (json: Any) -> Void in
                let dict = json as! NSDictionary
                let cityWeatherArray = dict["weather"] as! NSArray
                let cityWeatherDict = cityWeatherArray[0] as! NSDictionary
                
                print(cityWeatherDict["description"])
            })
    }
    
  let openWeatherMapAPI = OpenWeatherMapAPI()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}


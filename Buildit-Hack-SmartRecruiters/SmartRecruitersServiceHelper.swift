//
//  SmartRecruitersServiceHelper.swift
//  Buildit-Hack-SmartRecruiters
//
//  Created by Manprit Singh Gill on 19/05/2017.
//  Copyright © 2017 Manprit Singh Gill. All rights reserved.
//
import Foundation

struct SmartRecruitersServiceHelper {
    
    /**
     Process a set of Dictionary<String, Any?> results.
     
     - Parameter results: a dictionary containing response from the 5 day forecast API.
     
     - Returns : A dictionary containing an array of Forecast models for a Date.
     */
    static func parseStatusResult(results: Dictionary<String, Any?>) -> Dictionary<Date, [Status]> {
        var city = ""
        var dict = Dictionary<Date, [Status]>()
        
        if let cityDict = results["city"] as? Dictionary<String, Any?> {
            let cityName = cityDict["name"] as! String
            let cityCountry = cityDict["country"] as! String
            
            city = "\(cityName), \(cityCountry)"
        }
        
//        if let listDictArray = results["list"] as? [Dictionary<String, Any>] {
//            dict = self.processForecastList(forecastList: listDictArray, city: city)
//        }
        
        return dict
    }
    
    /**
     Process a forecast list object and create a dictionary to return of key: date, value: array of Forecasts model objects.
     
     - Parameters
     - forecastList: An array of 3 hour forecast objects returned from the API
     - city: A string containing the queried city and country (e.g. London, GB)
     
     - Returns: A structured set of an array of Forecast models with it's Date as the key.
     */
//    private static func processForecastList(forecastList: [Dictionary<String, Any>], city: String) -> Dictionary<Date, [Forecast]> {
//        
//        var dict = Dictionary<Date, [Forecast]>()
//        let calender = Calendar(identifier: .gregorian)
//        
//        for obj in forecastList {
//            let forecastModel = self.forecastObjectToModel(obj: obj, city: city)
//            
//            guard let forecastDate = forecastModel.date else {
//                return [:]
//            }
//            
//            let date = calender.startOfDay(for: forecastDate)
//            
//            if let _ = dict[date] {
//                var vmArray = dict[date]
//                vmArray?.append(forecastModel)
//                dict[date] = vmArray
//            } else {
//                let initArray = [forecastModel]
//                dict[date] = initArray
//            }
//        }
//        
//        return dict
//    }
//    
    /**
     Given data for a forecast object returned from the API, initialise a Forecast model object and return.
     
     - Parameters
     - obj: A forecast object returned from the API.
     - city: A string containing the queried city and country (e.g. London, GB)
     
     - Returns: A Forecast model object.
     */
//    private static func forecastObjectToModel(obj: Dictionary<String, Any>, city: String) -> Forecast {
//        
//        guard let unixDate = obj["dt"] as? Int,
//            let weatherDict = obj["weather"] as? [Dictionary<String, Any?>],
//            let weatherType = weatherDict[0]["description"] as? String,
//            let main = obj["main"] as? Dictionary<String, Double>,
//            let temp = main["temp"],
//            let maxTemp = main["temp_max"],
//            let minTemp = main["temp_min"],
//            let humidity = main["humidity"]
//            else {
//                return Forecast()
//        }
//        
//        let date = Date(timeIntervalSince1970: TimeInterval(unixDate))
//        
//        let forecast = Forecast(maxTemp: maxTemp, minTemp: minTemp, temp: temp, date: date, weather: weatherType, city: city, humidity: Int(humidity))
//        return forecast
//    }
    
}

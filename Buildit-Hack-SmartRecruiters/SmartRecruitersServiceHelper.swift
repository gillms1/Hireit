//
//  SmartRecruitersServiceHelper.swift
//  Buildit-Hack-SmartRecruiters
//
//  Created by Manprit Singh Gill on 19/05/2017.
//  Copyright © 2017 Manprit Singh Gill. All rights reserved.
//
import Foundation

struct SmartRecruitersServiceHelper {
    

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
    
    static func parseCandidatesResult(results: Dictionary<String, Any?>) -> [Candidate] {
        var candidates = [Candidate]()
        
        if let candidatesArr = results["content"] as? [Dictionary<String, Any?>] {
            
            for candidate in candidatesArr {
                
                guard let firstName = candidate["firstName"] as? String else {
                    break
                }
                
                let c = Candidate(firstName: firstName)
                candidates.append(c)
            }
            
        }
    
        return candidates
    }
    
}

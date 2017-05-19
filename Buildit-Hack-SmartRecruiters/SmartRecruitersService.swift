//
//  SmartRecruitersService.swift
//  Buildit-Hack-SmartRecruiters
//
//  Created by Manprit Singh Gill on 19/05/2017.
//  Copyright © 2017 Manprit Singh Gill. All rights reserved.
//

import Foundation
import Alamofire

typealias DownloadCompleteWithTuple = (Dictionary<Date, [Status]>?, Error?)->Void

protocol SmartRecruitersServiceProtocol {
    func fetchStatus(completed: @escaping DownloadCompleteWithTuple)
}

class SmartRecruitersService : SmartRecruitersServiceProtocol {
    
    /**
     Call the 5day forecast openweather API, get the response and forward the results onto the
     parseForecastResults function. Pass the parsed results through to the completion block.
     
     - Parameter completed: Completion block returning a tuple Dictionary<Date, [Forecast]>.
     */
    func fetchStatus(completed: @escaping DownloadCompleteWithTuple) {
        var urlString = STATUS_URL
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let statusURL = URL(string: urlString)
        
        let headers: HTTPHeaders = [
            "X-SmartToken": API_KEY,
        ]
        
        Alamofire.request(statusURL!, headers: headers).responseJSON { (response) in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, Any?> {
                let results = SmartRecruitersServiceHelper.parseStatusResult(results: dict)
                completed(results, nil)
            } else {
                completed(nil, response.result.error)
            }
        }
    }
}

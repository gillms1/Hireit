//
//  SmartRecruitersService.swift
//  Buildit-Hack-SmartRecruiters
//
//  Created by Manprit Singh Gill on 19/05/2017.
//  Copyright © 2017 Manprit Singh Gill. All rights reserved.
//

import Foundation
import Alamofire

typealias DownloadCompleteWithCandidates = ([Candidate]?, Error?)->Void
typealias CreateCandidateComplete = (Bool?)->Void

protocol SmartRecruitersServiceProtocol {
    func fetchCandidates(completed: @escaping DownloadCompleteWithCandidates)
    func createCandidate(candidate: Candidate, completed: @escaping CreateCandidateComplete)
}

class SmartRecruitersService : SmartRecruitersServiceProtocol {
    
    func fetchCandidates(completed: @escaping DownloadCompleteWithCandidates) {
        var urlString = CANDIDATES_URL
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let statusURL = URL(string: urlString)
        
        let headers: HTTPHeaders = [
            "X-SmartToken": API_KEY,
            ]
        
        Alamofire.request(statusURL!, headers: headers).responseJSON { (response) in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, Any?> {
                let results = SmartRecruitersServiceHelper.parseCandidatesResult(results: dict)
                completed(results, nil)
            } else {
                completed(nil, response.result.error)
            }
        }
    }
    
    func createCandidate(candidate: Candidate, completed: @escaping CreateCandidateComplete) {
        var urlString = CANDIDATES_URL
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let createCandidateURL = URL(string: urlString)
        
        let headers: HTTPHeaders = [
            "X-SmartToken": API_KEY,
            ]
        
        let parameters : [String: String] = ["firstName" : candidate.firstName, "lastName" : candidate.surname, "email" : candidate.email, "phoneNumber" : candidate.phoneNumber ]
        
        Alamofire.request(createCandidateURL!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    print(data)
                    completed(true)
                }
                break
                
            case .failure(_):
                completed(false)
                break
            }
        }
        
    }
    
}

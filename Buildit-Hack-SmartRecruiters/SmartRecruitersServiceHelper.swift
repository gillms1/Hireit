//
//  SmartRecruitersServiceHelper.swift
//  Buildit-Hack-SmartRecruiters
//
//  Created by Manprit Singh Gill on 19/05/2017.
//  Copyright © 2017 Manprit Singh Gill. All rights reserved.
//
import Foundation

struct SmartRecruitersServiceHelper {
    
    
    static func parseCandidatesResult(results: Dictionary<String, Any?>) -> [Candidate] {
        var candidates = [Candidate]()
        
        if let candidatesArr = results["content"] as? [Dictionary<String, Any?>] {
            
            for candidate in candidatesArr {
                
                guard let firstName = candidate["firstName"] as? String,
                      let surname = candidate["lastName"] as? String,
                      let email = candidate["email"] as? String,
                    let phoneNumber = candidate["phoneNumber"] as? String
                else {
                    break
                }
                
                let c = Candidate(firstName: firstName, surname: surname, email: email, phoneNumber: phoneNumber, status: nil)
                candidates.append(c)
            }
            
        }
    
        return candidates
    }
    
}

//
//  Candidate.swift
//  Buildit-Hack-SmartRecruiters
//
//  Created by Manprit Singh Gill on 19/05/2017.
//  Copyright © 2017 Manprit Singh Gill. All rights reserved.
//

import Foundation

struct Candidate {
    private(set) var firstName: String!
    private(set) var surname: String!
    private(set) var email: String!
    private(set) var phoneNumber: String!
    private(set) var status: Status?

    init(firstName: String, surname: String, email: String, phoneNumber: String, status: Status?) {
        self.firstName = firstName
        self.surname = surname
        self.email = email
        self.phoneNumber = phoneNumber
        self.status = status
    }
    
    private func configureSourceData() {
        
        var defaultSourceDictionary = Dictionary<String, String>()
        defaultSourceDictionary["sourceTypeId"] = "Other"
        defaultSourceDictionary["sourceSubTypeId"] = "CAMPAIGN"
        defaultSourceDictionary["sourceId"] = "OTHER"
    }
}

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
    
    init(firstName: String) {
        self.firstName = firstName
    }
}

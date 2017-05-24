//
//  Constants.swift
//  Buildit-Hack-SmartRecruiters
//
//  Created by Manprit Singh Gill on 19/05/2017.
//  Copyright © 2017 Manprit Singh Gill. All rights reserved.
//

import Foundation

private let BASE_URL = "https://api.smartrecruiters.com/v1/postings/"
private let STATUS_END_POINT = "&units=metric"

let API_KEY = "xxxxx"
let STATUS_URL = "\(BASE_URL)\(STATUS_END_POINT)London, uk\(API_KEY)"
let STATUS_URL2 = "https://api.smartrecruiters.com/v1/postings/xxxxxxxx/candidates/24feb056-fadc-42b4-90ad-3fd7357ea668/status"
let CANDIDATES_URL = "https://api.smartrecruiters.com/candidates"

typealias DownloadComplete = () -> ()

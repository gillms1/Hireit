//
//  Constants.swift
//  Buildit-Hack-SmartRecruiters
//
//  Created by Manprit Singh Gill on 19/05/2017.
//  Copyright © 2017 Manprit Singh Gill. All rights reserved.
//

import Foundation

private let BASE_URL = "https://api.smartrecruiters.com/v1/"
private let STATUS_END_POINT = "&units=metric"

let API_KEY = "9094f33d1caf428fa939c0c250f2ccd2"
let STATUS_URL = "\(BASE_URL)\(STATUS_END_POINT)London, uk\(API_KEY)"

typealias DownloadComplete = () -> ()

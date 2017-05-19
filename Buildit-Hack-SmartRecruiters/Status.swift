//
//  Status.swift
//  Buildit-Hack-SmartRecruiters
//
//  Created by Manprit Singh Gill on 19/05/2017.
//  Copyright © 2017 Manprit Singh Gill. All rights reserved.
//

import Foundation


enum Status: String {

    case new = "NEW"
    case inReview = "IN-REVIEW"
    case interview = "INTERVIEW"
    case offer = "OFFER"
    case hire = "HIRE"
    case rejected = "REJECTED"
    case withdrawn = "WITHDRAWN"
    case lead = "LEAD"
    case transferred = "TRANSFERRED"

    func statusImage() -> String {

        switch self {
        case .new:
            return "🐣"
        case .inReview:
            return "😱"
        case .interview:
            return "👩‍💻"
        case .offer:
            return "💰"
        case .rejected:
            return "😭"
        case .withdrawn:
            return "☠️"
        case .lead:
            return "👨‍👦"
        case .transferred:
            return "✈️"
        default:
            return "😆"
        }
    }

    static func giveMeARandomStatusPlease() -> Status {

        let possibleStatus = ["NEW", "IN-REVIEW", "INTERVIEW", "OFFER", "HIRE", "REJECTED", "WITHDRAWN", "LEAD", "TRANSFERRED"]
        let randomIndex = Int(arc4random_uniform(UInt32(possibleStatus.count)))
        let statusValue = possibleStatus[randomIndex]

        let status = Status(rawValue: statusValue) ?? Status(rawValue: "new")

        return status!
    }
}

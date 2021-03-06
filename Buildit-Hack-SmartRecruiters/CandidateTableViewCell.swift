//
//  CandidateTableViewCell.swift
//  Buildit-Hack-SmartRecruiters
//
//  Created by Juliana Cipa on 19/05/2017.
//  Copyright © 2017 Manprit Singh Gill. All rights reserved.
//

import UIKit

class CandidateTableViewCell: UITableViewCell {

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var status: UILabel!

    func configureCell(candidate: Candidate) {

        self.firstName.text = candidate.firstName
        self.lastName.text = candidate.surname
        self.status.text = candidate.status?.statusImage()
    }
}

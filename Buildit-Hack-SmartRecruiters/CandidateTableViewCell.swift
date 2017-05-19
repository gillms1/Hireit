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

    func configureCell(candidate: Candidate) {

        self.firstName.text = candidate.firstName
        self.lastName.text = candidate.surname
    }
}

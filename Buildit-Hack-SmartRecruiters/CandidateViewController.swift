//
//  CandidateViewController.swift
//  Buildit-Hack-SmartRecruiters
//
//  Created by Juliana Cipa on 19/05/2017.
//  Copyright © 2017 Manprit Singh Gill. All rights reserved.
//

import UIKit

class CandidateViewController: UIViewController {

    @IBOutlet weak var createButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureLayout()
    }

    func configureLayout() {

        createButton.roundViewWithCorner(5)
    }

    @IBAction func submitData() {
        
    }

}

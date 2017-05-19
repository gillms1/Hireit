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

    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var emailAddressTextfield: UITextField!
    @IBOutlet weak var phoneNumberTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureLayout()
    }

    func configureLayout() {

        createButton.roundViewWithCorner(5)
    }

    @IBAction func submitData() {

        let firstName = firstNameTextfield.text
        let lastName = lastNameTextfield.text
        let emailAddress = emailAddressTextfield.text
        let phoneNumber = phoneNumberTextfield.text

        _ = Candidate(firstName: firstName!, surname: lastName!, email: emailAddress!, phoneNumber: phoneNumber!)

    }

}

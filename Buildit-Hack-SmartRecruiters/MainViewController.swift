//
//  MainViewController.swift
//  Buildit-Hack-SmartRecruiters
//
//  Created by Juliana Cipa on 19/05/2017.
//  Copyright © 2017 Manprit Singh Gill. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate {

    @IBOutlet fileprivate weak var tableView: UITableView!

    @IBOutlet weak var createCandidateButton: UIButton!

    var smartRecruitersService: SmartRecruitersServiceProtocol = SmartRecruitersService()

    var candidates = Array<Candidate>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.fetchStatus {

        }

        createCandidateButton.layer.cornerRadius = 5
        createCandidateButton.clipsToBounds = true

        tableView.delegate = self
        //tableView.dataSource = self as! UITableViewDataSource
    }


    private func fetchStatus(complete: @escaping DownloadComplete) {

        //        self.smartRecruitersService.fetchStatus { (results, error) in
        //
        //            print(results)
        //            print(error)
        //            complete()
        //        }

        self.smartRecruitersService.fetchCandidates { (candidates, error) in

            if let results = candidates {
                print(results)
            }
            complete()
        }
        
    }


    // MARK: Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return candidates.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            ?? UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")

        cell.textLabel?.text = candidates[indexPath.row].firstName
        return cell
    }

}

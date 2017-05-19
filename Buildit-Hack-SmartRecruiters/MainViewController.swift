//
//  MainViewController.swift
//  Buildit-Hack-SmartRecruiters
//
//  Created by Juliana Cipa on 19/05/2017.
//  Copyright © 2017 Manprit Singh Gill. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet fileprivate weak var tableView: UITableView!

    @IBOutlet weak var createCandidateButton: UIButton!

    var smartRecruitersService: SmartRecruitersServiceProtocol = SmartRecruitersService()

    var candidates = Array<Candidate>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.fetchStatus {

        }

        configureLayout()

        tableView.delegate = self
        tableView.dataSource = self

        candidates = [Candidate(firstName: "Juliana", surname: "C", email: "juli.c@gmail.com", phoneNumber: "0044788878787")]
        tableView.reloadData()
    }

    func configureLayout() {
        createCandidateButton.roundViewWithCorner(5)
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

        let cell: CandidateTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CandidateTableViewCell

        cell.configureCell(candidate: candidates[indexPath.row])

        return cell
    }

}

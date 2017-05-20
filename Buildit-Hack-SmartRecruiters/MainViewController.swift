//
//  MainViewController.swift
//  Buildit-Hack-SmartRecruiters
//
//  Created by Juliana Cipa on 19/05/2017.
//  Copyright © 2017 Manprit Singh Gill. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet fileprivate weak var tableView: UITableView!

    @IBOutlet weak var createCandidateButton: UIButton!

    var smartRecruitersService: SmartRecruitersServiceProtocol = SmartRecruitersService()

    var candidates = Array<Candidate>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.configureLayout()

        tableView.delegate = self
        tableView.dataSource = self

        //candidates = [Candidate(firstName: "Juliana", surname: "C", email: "juli.c@gmail.com", phoneNumber: "0044788878787", status: "")]
        

    }

    override func viewWillAppear(_ animated: Bool) {
        self.fetchCandidates {
            self.tableView.reloadData()
        }
    }

    private func configureLayout() {

        createCandidateButton.roundViewWithCorner(5)
    }

    private func fetchCandidates(complete: @escaping DownloadComplete) {

        self.smartRecruitersService.fetchCandidates { (candidates, error) in

            if let results = candidates {
                self.candidates = results
            }
            complete()
        }
    }

}

extension MainViewController : UITableViewDataSource {

    // MARK: Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return candidates.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: CandidateTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CandidateTableViewCell

        cell.configureCell(candidate: candidates[indexPath.row])

        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.init(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        } else {
            cell.backgroundColor = UIColor.white
        }

        return cell
    }
}

extension MainViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

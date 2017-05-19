//
//  MainViewController.swift
//  Buildit-Hack-SmartRecruiters
//
//  Created by Juliana Cipa on 19/05/2017.
//  Copyright © 2017 Manprit Singh Gill. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var smartRecruitersService: SmartRecruitersServiceProtocol = SmartRecruitersService()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.fetchStatus {

        }
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
    
}

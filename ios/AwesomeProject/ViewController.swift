//
//  ViewController.swift
//  AwesomeProject
//
//  Created by 林 on 2024/7/18.
//

import UIKit
import React

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func showRnViewAction(_ sender: Any) {
        print("Hello")
        guard let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios") else { return }
         let mockData:NSDictionary = ["scores":
             [
                 ["name":"Alex", "value":"42"],
                 ["name":"Joel", "value":"10"]
             ]
         ]

         let rootView = RCTRootView(
             bundleURL: jsCodeLocation,
             moduleName: "RNHighScores",
             initialProperties: mockData as [NSObject : AnyObject],
             launchOptions: nil
         )
         let vc = UIViewController()
         vc.view = rootView
         self.present(vc, animated: true, completion: nil)
    }
}


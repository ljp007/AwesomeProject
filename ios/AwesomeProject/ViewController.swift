//
//  ViewController.swift
//  AwesomeProject
//
//  Created by 林 on 2024/7/18.
//

import UIKit
import React

class ViewController: UIViewController,RCTBridgeDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func showRnViewAction(_ sender: Any) {
        print("Hello")
        guard let bridge = RCTBridge(delegate: self, launchOptions: nil) else { return }
        let rootView = RCTRootView(bridge:bridge, moduleName: "AwesomeProject", initialProperties: nil)

        rootView.backgroundColor = UIColor.white
        let vc = UIViewController()
        vc.view = rootView
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func sourceURL(for bridge: RCTBridge) -> URL? {
          #if DEBUG
        return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackExtension: nil)
          #else
          return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
          #endif
    }}


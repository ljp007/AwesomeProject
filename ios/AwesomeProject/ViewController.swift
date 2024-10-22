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
        NotificationCenter.default.addObserver(self, selector: #selector(handleUsersLoaded(notification:)), name:NSNotification.Name("UsersLoaded"), object: nil)
        
        
        Task {
            do {
                
                let stock = try await StockDataManger.shared.fetchStockData(from: "https://api.example.com/stock/AAPL")
                print("Stock symbol: \(stock.symbol), price: \(stock.price)")
            } catch {
                print("Failed to fetch stock data: \(error)")
            }
        }
        
    }
    
    
    @IBAction func showRnViewAction(_ sender: Any) {
        print("Hello")
        guard let bridge = RCTBridge(delegate: self, launchOptions: nil) else { return }
        let rootView = RCTRootView(bridge:bridge, moduleName: "AwesomeProject", initialProperties: nil)
        
        rootView.backgroundColor = UIColor.white
        let vc = UIViewController()
        vc.view = rootView
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .overFullScreen
        nav.navigationBar.isHidden = true
        self.present(nav, animated: true, completion: nil)
        
        // Log to verify module loading
        if let module = bridge.module(forName: "EventEmitterModule") {
            print("EventEmitterModule is loaded: \(module)")
        } else {
            print("EventEmitterModule is not loaded")
        }
        
        NotificationCenter.default.post(name: Notification.Name("EventEmitterModuleEvent"), object: nil, userInfo: ["success": true])

    }
    
    
    
    func sourceURL(for bridge: RCTBridge) -> URL? {
#if DEBUG
        return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackExtension: nil)
#else
        return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
#endif
    }
    
    @objc func bridge(_ bridge: RCTBridge!, didReceiveModuleEventName eventName: String, withParams params: [AnyHashable : Any]!) {
       if eventName == "UsersLoaded" {
         // 处理事件
           print("Users loaded: \(String(describing: params))")
       }
     }
    
    @objc func handleUsersLoaded(notification: Notification) {
        if let userInfo = notification.userInfo {
              print("Users loaded: \(userInfo)")
        }
     }
}


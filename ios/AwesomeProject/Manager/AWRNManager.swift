//
//  AWRNManager.swift
//  AwesomeProject
//
//  Created by 林 on 2024/7/27.
//

import Foundation
import UIKit
import React

@objc(AWRNManager)
class AWRNManager: NSObject {
   
    
  @objc
  func showAlert(_ title: NSString, message: NSString) {
    DispatchQueue.main.async {
      let alertController = UIAlertController(title: title as String, message: message as String, preferredStyle: .alert)
      let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
      alertController.addAction(okAction)
      
        if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
            rootViewController.presentedViewController?.present(alertController, animated: true, completion: nil)
      }
    }
  }

  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}

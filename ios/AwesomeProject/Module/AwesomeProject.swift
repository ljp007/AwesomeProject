//
//  AwesomeProject.swift
//  AwesomeProject
//
//  Created by 林 on 2024/7/27.
//

import Foundation
import Foundation

@objc(AwesomeProject)
class AwesomeProject: NSObject {
  @objc
  func methodQueue() -> DispatchQueue {
    return DispatchQueue.main
  }

  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}

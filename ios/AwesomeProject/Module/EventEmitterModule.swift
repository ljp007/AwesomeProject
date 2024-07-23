//
//  EventEmitterModule.swift
//  AwesomeProject
//
//  Created by 林 on 2024/7/22.
//

import Foundation
import Foundation
import React

@objc(EventEmitterModule)
class EventEmitterModule: RCTEventEmitter {
  override init() {
    super.init()
    NotificationCenter.default.addObserver(self, selector: #selector(emitEventInternal(_:)), name: Notification.Name("EventEmitterModuleEvent"), object: nil)
  }

  override static func requiresMainQueueSetup() -> Bool {
    return true
  }

  @objc override func supportedEvents() -> [String] {
    return ["UsersLoaded"]
  }

  @objc func emitEventInternal(_ notification: Notification) {
    if let userInfo = notification.userInfo, let name = notification.name.rawValue as String? {
      sendEvent(withName: name, body: userInfo)
    }
  }
  
    @objc func emitEvent(_ name: String, body: [String: Any]) {
        sendEvent(withName: name, body: body)
    }
}

//
//  AwUserVIewController.swift
//  AwesomeProject
//
//  Created by 林 on 2024/10/24.
//

import UIKit
import SwiftUI

class AwUserViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userListView = UserListView()
        let userVc = UIHostingController(rootView: userListView)
        addChild(userVc)
        view.addSubview(userVc.view)
        // 设置 UIHostingController 的视图的 frame 和自动布局
        userVc.view.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    userVc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    userVc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    userVc.view.topAnchor.constraint(equalTo: view.topAnchor),
                    userVc.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        userVc.didMove(toParent: self)
    }
}

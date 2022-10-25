//
//  ViewController.swift
//  Singleton-Derrick
//
//  Created by Derrick kim on 2022/10/18.
//

import UIKit

class ViewController: UIViewController {
    private let userInfo = UserInfo.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        userInfo.id = "derrick"
        userInfo.password = "123"
    }
}


//
//  ViewController.swift
//  FactoryPattern
//
//  Created by 오경식 on 2022/10/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let factory = MacBookFactory()
        let macAir = factory.createMacBook(name: "unchain", level: .air)
        let macPro = factory.createMacBook(name: "unchain", level: .pro)

        macAir.printSpec()
        macPro.printSpec()
    }
}


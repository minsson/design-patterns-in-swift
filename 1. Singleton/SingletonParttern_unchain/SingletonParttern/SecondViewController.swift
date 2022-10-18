//
//  SecondViewController.swift
//  SingletonParttern
//
//  Created by 오경식 on 2022/10/18.
//

import UIKit

class SecondViewController: UIViewController {


    @IBAction func dismiss(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showAll.numberOfLines = 0
        showAll.text = Singleton.shared.showAll()
    }
    
    @IBOutlet weak var showAll: UILabel!


}

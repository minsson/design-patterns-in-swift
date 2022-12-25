//
//  Receiver.swift
//  Command-Judy
//
//  Created by Judy on 2022/12/07.
//

import UIKit

protocol Receiver {
    func changeTitle(_ title: String)
}

extension UILabel: Receiver {
    func changeTitle(_ title: String) {
        self.text = "\(title)"
    }
}

extension UIButton: Receiver {
    func changeTitle(_ title: String) {
        self.setTitle("\(title)", for: .normal)
    }
}

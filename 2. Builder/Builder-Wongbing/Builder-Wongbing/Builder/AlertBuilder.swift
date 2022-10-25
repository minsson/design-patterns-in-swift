//
//  AlertBuilder.swift
//  Builder-Wongbing
//
//  Created by 이원빈 on 2022/10/19.
//

import UIKit

protocol AlertBuilder {
    var alertController: UIAlertController { get set }
    
    func setAlertController(
        title: String,
        message: String,
        preferredStyle: UIAlertController.Style
    ) -> Self
    func addAction(title: String, style: UIAlertAction.Style) -> Self
}

final class DefaultAlertBuilder: AlertBuilder {
    var alertController: UIAlertController = UIAlertController()
    
    func setAlertController(title: String, message: String, preferredStyle: UIAlertController.Style) -> Self {
        alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: preferredStyle
        )
        return self
    }
    
    func addAction(title: String, style: UIAlertAction.Style) -> Self {
        let action = UIAlertAction(title: title, style: style)
        alertController.addAction(action)
        return self
    }
}

//
//  Design.swift
//  AbstractFactoryPractice
//
//  Created by Kiwon Song on 2022/11/09.
//

import UIKit

class KoreanStyle: Factory {
    func createButton() -> UIButton {
        let blueButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .blue
            return button
        }()
        
        return blueButton
    }
    
    func createView() -> UIView {
        let redView: UIView = {
            let view = UIView()
            view.backgroundColor = .red
            return view
        }()

        return redView
    }
}

class UkraineStyle: Factory {
    func createButton() -> UIButton {
        let blueButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .blue
            return button
        }()
        
        return blueButton
    }
    
    func createView() -> UIView {
        let yellowView: UIView = {
            let view = UIView()
            view.backgroundColor = .yellow
            return view
        }()

        return yellowView
    }
}

//class ChinaStyle: Factory {
//    func createButton() -> UIButton {
//        let yellowButton: UIButton = {
//            let button = UIButton()
//            button.backgroundColor = .yellow
//            return button
//        }()
//
//        return yellowButton
//    }
//
//    func createView() -> UIView {
//        let redView: UIView = {
//            let view = UIView()
//            view.backgroundColor = .red
//            return view
//        }()
//
//        return redView
//    }
//}

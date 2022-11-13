//
//  ViewController.swift
//  AbstractFactoryPractice
//
//  Created by Kiwon Song on 2022/11/09.
//

import UIKit

class ViewController: UIViewController {
    static let abstractFactory = AbstractFactory(factory: KoreanStyle())
    
    let testView = abstractFactory.factory.createView()
    let testButton = abstractFactory.factory.createButton()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
   
    
    override func viewDidLoad() {
        self.view.backgroundColor = .systemBackground
        stackViewConfigure()
        setupStackviewConstraints()
    }
    
    func stackViewConfigure() {
        [testView, testButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        self.view.addSubview(stackView)
    }
    
    func setupStackviewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            testView.widthAnchor.constraint(equalToConstant: 100),
            testView.heightAnchor.constraint(equalToConstant: 50),
            testButton.widthAnchor.constraint(equalTo: testView.widthAnchor),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}

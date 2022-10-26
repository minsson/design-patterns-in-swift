//
//  ViewController.swift
//  Prototype-Judy
//
//  Created by Judy on 2022/10/25.
//

import UIKit

class ViewController: UIViewController {
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
        let cell = Cell(image: UIImage(systemName: "atom")!, name: "atom", color: .yellow)
       
        stack.addArrangedSubview(cell.clene().image)
        stack.addArrangedSubview(cell.clene().image)
        stack.addArrangedSubview(cell.clene().image)
        stack.addArrangedSubview(cell.clene().image)
    }
    
    private func setupLayout() {
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}



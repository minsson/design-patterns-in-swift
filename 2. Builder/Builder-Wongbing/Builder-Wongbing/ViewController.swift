//
//  ViewController.swift
//  Builder-Wongbing
//
//  Created by 이원빈 on 2022/10/14.
//

import UIKit

final class ViewController: UIViewController {
    
    private let label = DefaultLabelBuilder()
        .useAutoLayout()
        .setText(with: "안녕하세요")
        .setTextColor(with: .black)
        .setPreferredFont(.title2)
        .label
    
    private let button = DefaultButtonBuilder()
        .useAutoLayout()
        .setTitle(" 알람 버튼 ", for: .normal)
        .setTitleColor(.white, for: .normal)
        .setBackgroundColor(.blue)
        .setLayerCornerRadius(8)
        .button
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialView()
        addSubViews()
        setConstraints()
        addTarget()
    }
    
    private func setupInitialView() {
        view.backgroundColor = .systemBackground
    }
    
    private func addSubViews() {
        view.addSubview(label)
        view.addSubview(button)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80)
        ])
    }
    
    private func addTarget() {
        button.addTarget(
            self,
            action: #selector(alarmButtonDidTapped),
            for: .touchUpInside
        )
    }
    
    @objc func alarmButtonDidTapped() {
        let alertController = DefaultAlertBuilder()
            .setAlertController(
                title: "타이틀",
                message: "메세지",
                preferredStyle: .alert)
            .addAction(title: "확인", style: .default)
            .addAction(title: "취소", style: .cancel)
            .alertController
        present(alertController, animated: true)
    }
}

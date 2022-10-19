//
//  ViewController.swift
//  SingletonParttern
//
//  Created by 오경식 on 2022/10/18.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func touchActionButton(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController else { return }
        nextVC.modalTransitionStyle = .coverVertical
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let singleton = Singleton.shared

        singleton.definition = "객체의 인스턴스가 오직 1개만 생성되는 패턴. 이 패턴을 전역에서 접근할 수 있다."
        singleton.whyUse = """
        유저의 정보나 어떤 특정 객체의 정보를 전역적으로 공유해야 할 때 사용할 수 있다.
        또는 인스턴스가 두 개 이상 존재하면 문제가 생기거나 논리에 맞지 않을 경우에도 사용할 수 있다.
        DB를 관리하는 객체나 네트워크를 담당하는 객체 등등
        """
        singleton.advantage = """
        - 하나의 인스턴스만 존재한다는 것을 보장한다.
        - 한번만 생성하기 때문에 불필요한 코드를 줄일 수 있다.
        - 데이터의 전달이 쉬워진다.
        """
        singleton.disAdvantage = """
        - 한번에 너무 많은 곳에서 접근하게 될 경우 결합도가 높아진다.
        - 테스트가 힘들어진다.
        - 개방 폐쇄 원칙을 위배한다.(OCP)
            - 확장에는 열려있고 변경에는 닫혀있어야한다.
        """
    }
}


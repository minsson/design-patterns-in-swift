//
//  ViewController.swift
//  Prototype_Derrick
//
//  Created by Derrick kim on 2022/10/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let marin = Marin(health: 40,
                          attack: 5,
                          defence: 1)

        let medic = Medic(health: 50,
                          mana: 20,
                          defence: 1)

        marin.printStatus()
        medic.printStatus()

        var newMarin = marin.clone()
        var newMedic = medic.clone()

        print("Clone")

        newMarin.printStatus()
        newMedic.printStatus()

        var shallowCopyMarin = marin
        var deepCopyMarin = marin.clone()

        shallowCopyMarin.health += 7
        deepCopyMarin.defence += 5


        shallowCopyMarin.printStatus()
        deepCopyMarin.printStatus()
    }
}


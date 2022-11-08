//
//  ViewController.swift
//  bridge-BaekGom
//
//  Created by Baek on 2022/11/02.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        client()
    }
    
    func client() {
        let tv = TvSoundButton()
        let soundButton = SoundButton(implementor: tv)
        soundButton.up()
        soundButton.down()

        let radio = RadioSoundButton()
        soundButton.soundButtonImplementor = radio
        soundButton.set(percent: 0.5)
    }
}


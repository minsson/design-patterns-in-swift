//
//  ViewController.swift
//  Command-Judy
//
//  Created by Judy on 2022/12/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    private var flag = 0
    private var invoker = Invoker()
    private var titleCommand: Command!
    private var colorCommand: Command!
    private var labelCommand: Command!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleCommand = TitleCommand(receiver: button)
        colorCommand = ColorCommand(receiver: button)
        labelCommand = TitleCommand(receiver: label)
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        let count = flag % 3
        
        switch count {
        case 0:
            invoker.setCommand(labelCommand)
        case 1:
            invoker.setCommand(titleCommand)
        case 2:
            invoker.setCommand(colorCommand)
        default:
            invoker.setCommand(labelCommand)
        }

        invoker.executeCommand()
        flag += 1
    }

    @IBAction func didTapUndoButton(_ sender: Any) {
        invoker.undoCommand()
    }
}


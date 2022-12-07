//
//  Invoker.swift
//  Command-Judy
//
//  Created by Judy on 2022/12/07.
//

class Invoker {
    private var commands: [Command] = []
    
    func setCommand(_ command: Command) {
        self.commands.append(command)
    }
    
    func executeCommand() {
        commands.last?.execute()
    }
    
    func undoCommand() {
        commands.popLast()?.unexecute()
    }
}

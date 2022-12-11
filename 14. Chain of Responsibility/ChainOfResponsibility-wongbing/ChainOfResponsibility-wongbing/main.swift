//
//  main.swift
//  ChainOfResponsibility-wongbing
//
//  Created by 이원빈 on 2022/12/07.
//

protocol Handler: AnyObject {
    var nextHandler: Handler? { get set }
    
    @discardableResult
    func setNext(handler: Handler) -> Handler
    
    func handle(request: String) -> String?
}

extension Handler {
    
    func setNext(handler: Handler) -> Handler {
        self.nextHandler = handler
        return handler
    }
    
//    func handle(request: String) -> String? {
//        return nextHandler?.handle(request: request)
//    }
}

class MonkeyHandler: Handler {
    
    var nextHandler: Handler?
    
    func handle(request: String) -> String? {
        if request == "Banana" {
            return "Monkey: I'll eat the " + request + ".\n"
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

class SquirrelHandler: Handler {
    
    var nextHandler: Handler?
    
    func handle(request: String) -> String? {
        if request == "Nut" {
            return "Squieerl: I'll eat the " + request + ".\n"
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

class DogHandler: Handler {
    
    var nextHandler: Handler?
    
    func handle(request: String) -> String? {
        if request == "MeatBall" {
            return "Dog: I'll eat the " + request + ".\n"
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

class HumanHandler: Handler {
    
    var nextHandler: Handler?
    
    func handle(request: String) -> String? {
        if request == "Cup of coffee" {
            return nextHandler?.handle(request: request)
        } else {
            return "Human: I'll drink the " + request + ".\n"
        }
    }
}

class HumanHandler1: Handler {
    
    var nextHandler: Handler?
    
    func handle(request: String) -> String? {
        if request == "Cup of coffee" {
            return nextHandler?.handle(request: request)
        } else {
            return "Human: I'll drink the " + request + ".\n"
        }
    }
}

class Client {
    static func someClientCode(handler: Handler) {
        
        let food = ["Nut", "Banana", "Cup of coffee"]
        
        for item in food {
            
            print("Client: Who wants a " + item + "?\n")
            
            guard let result = handler.handle(request: item) else {
                print("  " + item + " was left untouched.\n")
                return
            }
            
            print("  " + result)
        }
    }
}

let monkey = MonkeyHandler()
let squirrel = SquirrelHandler()
let dog = DogHandler()
let human = HumanHandler()
let human1 = HumanHandler1()
monkey.setNext(handler: squirrel).setNext(handler: dog).setNext(handler: human).setNext(handler: human1)

// monkey -> squirrel -> dog -> human

Client.someClientCode(handler: monkey)

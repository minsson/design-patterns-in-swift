//
//  iPhone.swift
//  Builder-Kiwi
//
//  Created by Kiwon Song on 2022/10/19.
//

public struct iPhone {
    public let screen: Screen
    public let speaker: Speaker
    public let button: Set<Button>
    public let frame: Frame
    
    func getAllProperty() {
        print("screen = \(screen)")
        print("speaker = \(speaker)")
        print("button = \(button)")
        print("frame = \(frame)\n")
    }
}

public enum Screen: String {
    case pro
    case proMax
    case mini
    case normal
}

public enum Speaker: String {
    case bose
    case jbl
    case beats
    case sony
}

public enum Button: String {
    case cristal
    case plastic
    case iron
}

public enum Frame: String {
    case pro
    case proMax
    case mini
    case normal
}


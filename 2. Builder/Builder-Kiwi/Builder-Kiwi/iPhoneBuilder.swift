//
//  iPhoneBuilder.swift
//  Builder-Kiwi
//
//  Created by Kiwon Song on 2022/10/19.
//

public class iPhoneBuilder {
    public private(set) var screen: Screen = .normal
    public private(set) var speaker: Speaker = .jbl
    public private(set) var buttons: Set<Button> = []
    public private(set) var frame: Frame = .normal
    
    public func setScreen(_ screen: Screen) {
        self.screen = screen
    }
    public func setSpeaker(_ speaker: Speaker) {
        self.speaker = speaker
    }
    public func addButton(_ button: Button) {
        buttons.insert(button)
    }
    public func removeButton(_ button: Button) {
        buttons.remove(button)
    }
    public func setFrame(_ frame: Frame) {
        self.frame = frame
    }
    
    public func build() -> iPhone {
        return iPhone(screen: screen, speaker: speaker, button: buttons, frame: frame)
    }
}

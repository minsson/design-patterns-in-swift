//
//  ButtonBuilder.swift
//  Builder-Wongbing
//
//  Created by 이원빈 on 2022/10/19.
//

import UIKit

protocol ButtonBuilder: UseAutoLayout, UseLayer {
    var button: UIButton { get set }
    
    func setTitle(_ title: String, for state: UIControl.State) -> Self
    func setTitleColor(_ color: UIColor?, for state: UIControl.State) -> Self
    func setBackgroundColor(_ color: UIColor) -> Self
}

final class DefaultButtonBuilder: ButtonBuilder {
    typealias Builder = DefaultButtonBuilder
    
    var button: UIButton = UIButton()
    
    func useAutoLayout() -> Builder {
        button.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    func setTitle(_ title: String, for state: UIControl.State) -> Builder {
        button.setTitle(title, for: state)
        return self
    }
    
    func setTitleColor(_ color: UIColor?, for state: UIControl.State) -> Builder {
        button.setTitleColor(color, for: state)
        return self
    }
    
    func setBackgroundColor(_ color: UIColor) -> Builder {
        button.backgroundColor = color
        return self
    }
    
    // MARK: - UseLayer
    func setLayerMaskToBounds(_ bool: Bool) -> Builder {
        button.layer.masksToBounds = bool
        return self
    }
    
    func setLayerBorderWidth(_ width: CGFloat) -> Builder {
        button.layer.borderWidth = width
        return self
    }
    
    func setLayerBorderColor(_ color: UIColor) -> Builder {
        button.layer.borderColor = color.cgColor
        return self
    }
    
    func setLayerShadowOffset(width: CGFloat, height: CGFloat) -> DefaultButtonBuilder {
        button.layer.shadowOffset = CGSize(width: width, height: height)
        return self
    }
    
    func setLayerShadowOpacity(_ opacity: Float) -> Builder {
        button.layer.shadowOpacity = opacity
        return self
    }
    
    func setLayerCornerRadius(_ number: CGFloat) -> Builder {
        button.layer.cornerRadius = number
        return self
    }
    
    func setLayerBackgroundColor(_ color: UIColor) -> Builder {
        button.layer.backgroundColor = color.cgColor
        return self
    }
}

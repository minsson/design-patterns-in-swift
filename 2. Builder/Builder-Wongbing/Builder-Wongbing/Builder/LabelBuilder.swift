//
//  LabelBuilder.swift
//  Builder-Wongbing
//
//  Created by 이원빈 on 2022/10/19.
//

import UIKit

protocol LabelBuilder: UseAutoLayout, UseLayer {
    var label: UILabel { get }
    
    func setPreferredFont(_ font: UIFont.TextStyle) -> Self
    func setText(with text: String) -> Self
    func setTextColor(with textColor: UIColor) -> Self
    func setTextAlignment(_ alignment: NSTextAlignment) -> Self
    func numberOfLines(_ number: Int) -> Self
}

final class DefaultLabelBuilder: LabelBuilder {
    typealias Builder = DefaultLabelBuilder
    
    var label: UILabel = UILabel()
    
    func useAutoLayout() -> Builder {
        label.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    func setPreferredFont(_ font: UIFont.TextStyle) -> Builder {
        label.font = UIFont.preferredFont(forTextStyle: font)
        return self
    }
    
    func setText(with text: String) -> Builder {
        label.text = text
        return self
    }
    
    func setTextColor(with textColor: UIColor) -> Builder {
        label.textColor = textColor
        return self
    }
    
    func setTextAlignment(_ alignment: NSTextAlignment) -> Builder {
        label.textAlignment = alignment
        return self
    }
    
    func numberOfLines(_ number: Int) -> Builder {
        label.numberOfLines = number
        return self
    }
    
    func setLayerMaskToBounds(_ bool: Bool) -> Builder {
        label.layer.masksToBounds = bool
        return self
    }
    
    func setLayerBorderWidth(_ width: CGFloat) -> Builder {
        label.layer.borderWidth = width
        return self
    }
    
    func setLayerBorderColor(_ color: UIColor) -> Builder {
        label.layer.borderColor = color.cgColor
        return self
    }
    
    func setLayerShadowOffset(width: CGFloat, height: CGFloat) -> Builder {
        label.layer.shadowOffset = CGSize(width: width, height: height)
        return self
    }
    
    func setLayerShadowOpacity(_ opacity: Float) -> Builder {
        label.layer.shadowOpacity = opacity
        return self
    }
    
    func setLayerCornerRadius(_ number: CGFloat) -> Builder {
        label.layer.cornerRadius = number
        return self
    }
    
    func setLayerBackgroundColor(_ color: UIColor) -> Builder {
        label.layer.backgroundColor = color.cgColor
        return self
    }
}

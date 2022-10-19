//
//  Protocols.swift
//  Builder-Wongbing
//
//  Created by 이원빈 on 2022/10/19.
//

import UIKit

protocol UseAutoLayout {
    associatedtype Builder
    
    func useAutoLayout() -> Builder
}

protocol UseLayer {
    associatedtype Builder
    
    func setLayerMaskToBounds(_ bool: Bool) -> Builder
    func setLayerBorderWidth(_ width: CGFloat) -> Builder
    func setLayerBorderColor(_ color: UIColor) -> Builder
    func setLayerShadowOffset(width: CGFloat, height: CGFloat) -> Builder
    func setLayerShadowOpacity(_ opacity: Float) -> Builder
    func setLayerCornerRadius(_ number: CGFloat) -> Builder
    func setLayerBackgroundColor(_ color: UIColor) -> Builder
}

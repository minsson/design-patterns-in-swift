//
//  SquareButtonView.swift
//  Strategy-Minsson
//
//  Created by minsson on 2022/11/16.
//

import SwiftUI

struct TransportationSelectionButtonView: View {
    
    var transportation: Transportation
    
    @Binding var hightlightSwitch: [Transportation: Bool]
    @Binding var navigation: Navigation
    @Binding var resultLabel: String
    
    var body: some View {
        Button(transportation.description) {
            navigation.setStrategy(strategy: transportation.strategy)
            
            resultLabel = transportation.description
            
            hightlight()
        }
        .tint(.white)
        .frame(height: 30)
        .padding(.horizontal, 10)
        .background(hightlightSwitch[transportation]! ? .blue : .gray)
        .cornerRadius(10)
    }
    
}

extension TransportationSelectionButtonView {
    
    private func hightlight() {
        hightlightSwitch.keys.forEach { key in
            hightlightSwitch[key] = false
        }
        hightlightSwitch[transportation]?.toggle()
    }
    
}

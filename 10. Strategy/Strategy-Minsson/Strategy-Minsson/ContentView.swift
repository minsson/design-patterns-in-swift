//
//  ContentView.swift
//  Strategy-Minsson
//
//  Created by minsson on 2022/11/16.
//

import SwiftUI

struct ContentView: View {

    @State private var navigation = Navigation()
    @State private var transportationSelectionLabel = ""
    @State private var algorithmResultLabel = ""
    @State private var hightlightSwitch: [Transportation: Bool] =
    [
        .walk: false,
        .car: false,
        .publicTransportation: false,
        .bicycle: false,
        .quickboard: false
    ]
    
    var body: some View {
        VStack {
            Text(transportationSelectionLabel == "" ? "" : "\(transportationSelectionLabel)(으)로 설정되었습니다.")
            Text("\(algorithmResultLabel)")
            
            HStack {
                Spacer(minLength: 16)
                
                TransportationSelectionButtonView(
                    transportation: .walk,
                    hightlightSwitch: $hightlightSwitch,
                    navigation: $navigation,
                    resultLabel: $transportationSelectionLabel
                )
                
                TransportationSelectionButtonView(
                    transportation: .car,
                    hightlightSwitch: $hightlightSwitch,
                    navigation: $navigation,
                    resultLabel: $transportationSelectionLabel
                )
                
                TransportationSelectionButtonView(
                    transportation: .publicTransportation,
                    hightlightSwitch: $hightlightSwitch,
                    navigation: $navigation,
                    resultLabel: $transportationSelectionLabel
                )
                
                TransportationSelectionButtonView(
                    transportation: .bicycle,
                    hightlightSwitch: $hightlightSwitch,
                    navigation: $navigation,
                    resultLabel: $transportationSelectionLabel
                )
                
                TransportationSelectionButtonView(
                    transportation: .quickboard,
                    hightlightSwitch: $hightlightSwitch,
                    navigation: $navigation,
                    resultLabel: $transportationSelectionLabel
                )

                Spacer(minLength: 16)
            }
            
            Button("실행") {
                algorithmResultLabel = navigation.execute()
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
    
}

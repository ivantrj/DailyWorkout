//
//  PrimaryButtonStyle.swift
//  DailyWorkout
//
//  Created by ivan ruwido  on 04.07.23.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    var fillColor: Color = .darkPrimaryButton
    func makeBody(configuration: Configuration) -> some View {
        return PrimaryButton(configuration: configuration, fillColor: fillColor)
    }
    
    struct PrimaryButton: View {
        let configuration: Configuration
        let fillColor: Color
        var body: some View {
            return configuration.label
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(fillColor)
                )
                
        }
    }
}

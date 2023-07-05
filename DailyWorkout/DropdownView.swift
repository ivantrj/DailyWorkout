//
//  DropdownView.swift
//  DailyWorkout
//
//  Created by ivan ruwido  on 04.07.23.
//

import SwiftUI

struct DropdownView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Exercise")
                    .font(.system(size: 22, weight: .semibold))
                Spacer()
                
            }
            .padding(.vertical, 10)
            Button(action: {}) {
                HStack {
                    Text("Pushups")
                        .font(.system(size: 28, weight: .semibold))
                    Spacer()
                    Image(systemName: "arrowtriangle.down.circle")
                        .font(.system(size: 24, weight: .medium))
                }
            }
            .buttonStyle(PrimaryButtonStyle(fillColor: .primaryButton))
        }
        .padding(15)
    }
}

struct DropdownView_Previews: PreviewProvider {
    static var previews: some View {
        DropdownView()
    }
}

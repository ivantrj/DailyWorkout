//
//  RemindView.swift
//  DailyWorkout
//
//  Created by ivan ruwido  on 05.07.23.
//

import SwiftUI

struct RemindView: View {
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Button(action: {}) {
                Text("Create")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.primary)
            }
            .padding(.bottom, 15)
            Button(action: {}) {
                Text("Skip")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.primary)
            }
        }
        .navigationTitle("Reminder")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.bottom, 15)
    }
}

struct RemindView_Previews: PreviewProvider {
    static var previews: some View {
        RemindView()
    }
}

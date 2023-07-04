//
//  ContentView.swift
//  DailyWorkout
//
//  Created by ivan ruwido  on 04.07.23.
//

import SwiftUI

struct LandingView: View {
    @State private var isActive = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Daily Workout")
                    .font(.system(size: 64, weight: .medium))
                    .background(LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing))
                    .shadow(radius: 8)
                Spacer()
                    Button(action: {
                        isActive = true
                    }) {
                        HStack {
                            Image(systemName: "plus.circle")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                            Text("Create a workout")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .navigationDestination(isPresented: $isActive) {
                        CreateView()
                    }
                }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("workout")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(Color.black.opacity(0.4))
                .edgesIgnoringSafeArea(.all)
                        
            )
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}

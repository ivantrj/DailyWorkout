//
//  CreateView.swift
//  DailyWorkout
//
//  Created by ivan ruwido  on 04.07.23.
//

import SwiftUI

struct CreateView: View {
    @StateObject var viewModel = CreateWorkoutViewModel()
    @State private var isActive = false

    var dropdownList: some View {
        ForEach(viewModel.dropdowns.indices, id: \.self) { index in
            DropdownView(viewModel: $viewModel.dropdowns[index])
        }
    }
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Select"), buttons: viewModel.displayedOptions.indices.map { index in
            let option = viewModel.displayedOptions[index]
            return .default(Text(option.formatted)) {
                // select option at index
                viewModel.send(action: .selectOption(index: index))
            }
        })
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                dropdownList
                Spacer()
                NavigationStack {
                    Button(action: {
                        isActive = true
                    }) {
                        Text("Next")
                            .font(.system(size: 24, weight: .medium))
                    }
                }
                .navigationDestination(isPresented: $isActive) {
                    RemindView()
                }
            }
            .actionSheet(isPresented: Binding<Bool>(get: {
                viewModel.hasSelectedDropdown
            }, set: {_ in }), content: { () -> ActionSheet in
                actionSheet
            })
            .navigationBarTitle("Create")
            .navigationBarBackButtonHidden(true)
            .padding(.bottom, 15)
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}

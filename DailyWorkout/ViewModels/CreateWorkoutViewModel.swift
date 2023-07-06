//
//  CreateWorkoutViewModel.swift
//  DailyWorkout
//
//  Created by ivan trajanovski  on 05.07.23.
//

import SwiftUI

final class CreateWorkoutViewModel: ObservableObject {
    @Published var dropdowns: [WorkoutPartViewModel] = [
        .init(type: .exercise),
        .init(type: .startAmount),
        .init(type: .increase),
    ]
    
    enum Action {
        case selectOption(index: Int)
    }
    
    var hasSelectedDropdown: Bool {
        selectedDropdownIndex != nil
    }
    
    var selectedDropdownIndex: Int? {
        dropdowns.enumerated().first(where: { $0.element.isSelected })?.offset
    }
    
    var displayedOptions: [DropdownOption] {
        guard let selectedDropdownIndex = selectedDropdownIndex else { return [] }
        return dropdowns[selectedDropdownIndex].options
    }
    
    func send(action: Action) {
        switch action {
        case let .selectOption(index):
            guard let selectedDropdownIndex = selectedDropdownIndex else { return }
            clearSelectedOptions()
            dropdowns[selectedDropdownIndex].options[index].isSelected = true
            clearSelectedDropdown()
        }
    }
    
    func clearSelectedOptions() {
        guard let selectedDropdownIndex = selectedDropdownIndex else { return }
        dropdowns[selectedDropdownIndex].options.indices.forEach { index in
            dropdowns[selectedDropdownIndex].options[index].isSelected = false
        }
    }
    
    func clearSelectedDropdown() {
        guard let selectedDropdownIndex = selectedDropdownIndex else { return }
        dropdowns[selectedDropdownIndex].isSelected = false
    }
}

extension CreateWorkoutViewModel {
    struct WorkoutPartViewModel: DropdownItemProtocol {
        var options: [DropdownOption]
        
        var headerTitle: String {
            type.rawValue
        }
        
        var dropdownTitle: String {
            options.first(where: { $0.isSelected })?.formatted ?? ""
        }
        
        var isSelected: Bool = false
        
        private var type: WorkoutPartType
        
        init(type: WorkoutPartType) {
            self.type = type
            switch type {
            case .exercise:
                self.options = ExerciseOption.allCases.map { $0.toDropdownOption }
            case .startAmount:
                self.options = StartOption.allCases.map { $0.toDropdownOption }
            case .increase:
                self.options = IncreaseOption.allCases.map { $0.toDropdownOption }
            }
            self.type = type
        }
        
        enum WorkoutPartType: String, CaseIterable {
            case exercise = "Exercise"
            case startAmount = "Starting Amount"
            case increase = "Daily Increase"
        }
        
        enum ExerciseOption: String, CaseIterable, DropdownOptionProtocol {
            var toDropdownOption: DropdownOption {
                .init(type: .text(rawValue), formatted: rawValue.capitalized, isSelected: self == .pullups)
            }
            
            case pullups
            case pushups
            case situps
        }
        
        enum StartOption: Int, CaseIterable, DropdownOptionProtocol {
            var toDropdownOption: DropdownOption {
                .init(type: .number(rawValue), formatted: "\(rawValue)", isSelected: self == .one)
            }
            
            case one = 1, two, three, four, five
        }
        
        enum IncreaseOption: Int, CaseIterable, DropdownOptionProtocol {
            var toDropdownOption: DropdownOption {
                .init(type: .number(rawValue), formatted: "+\(rawValue)", isSelected: self == .one)
            }
            
            case one = 1, two, three, four, five
        }
    }
}

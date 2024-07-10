//
//  OnboardingCoordinatorView.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 10.07.2024.
//

import SwiftUI

struct OnboardingCoordinatorView: View {

    @ObservedObject
    var coordinator: OnboardingCoordinator

    var body: some View {
        TabView(selection: $coordinator.currentStep) {
            OnboardingStepView(text: "Welcome to the App! Step 1", onNext: coordinator.next)
                .tag(0)

            OnboardingStepView(text: "Learn to use the App. Step 2", onNext: coordinator.next)
                .tag(1)
                .contentShape(Rectangle())
                .simultaneousGesture(DragGesture())

            OnboardingStepView(text: "Get Started! Step 3", onNext: coordinator.next)
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .animation(.default, value: coordinator.currentStep)
    }
}

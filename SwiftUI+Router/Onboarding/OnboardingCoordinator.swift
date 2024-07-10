//
//  OnboardingCoordinator.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 10.07.2024.
//

import Foundation

final class OnboardingCoordinator: ObservableObject {

    struct Output {
        let onFinished: () -> Void

        init(
            onFinished: @escaping () -> Void
        ) {
            self.onFinished = onFinished
        }
    }

    var output: Output?

    @Published
    var currentStep: Int = 0

    func next() {
        currentStep += 1

        if currentStep == 3 {
            output?.onFinished()
        }
    }
}

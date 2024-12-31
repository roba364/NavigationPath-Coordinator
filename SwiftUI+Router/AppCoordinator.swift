//
//  AppCoordinator.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 08.07.2024.
//

import Foundation

protocol AppCoordinatorElementsFactory {
    func sessionCoordinator() -> SessionCoordinator
    func onboardingCoordinator() -> OnboardingCoordinator
}

final class AppCoordinator: ObservableObject {

    enum ViewState {
        case onboarding(OnboardingCoordinator)
        case session(SessionCoordinator)
    }

    private let elementsFactory: AppCoordinatorElementsFactory

    @Published
    private(set) var viewState: ViewState?

    private var isOnboardingShown: Bool = true

    init(elementsFactory: AppCoordinatorElementsFactory) {
        self.elementsFactory = elementsFactory
    }

    func onAppear() {
        if !isOnboardingShown {
            showOnboarding()
        } else {
            showSession()
        }
    }

    private func showOnboarding() {
        let coordinator = elementsFactory.onboardingCoordinator()
        coordinator.output = .init(onFinished: { [weak self] in
            self?.showSession()
        })

        viewState = .onboarding(coordinator)
    }

    private func showSession() {
        let coordinator = elementsFactory.sessionCoordinator()

        viewState = .session(coordinator)
    }
}

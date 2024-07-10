//
//  AppCoordinatorView.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 08.07.2024.
//

import SwiftUI

struct AppCoordinatorView: View {

    @ObservedObject
    var coordinator: AppCoordinator

    var body: some View {
        VStack {
            if let viewState = coordinator.viewState {
                content(for: viewState)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(perform: coordinator.onAppear)
    }

    @ViewBuilder
    private func content(for viewState: AppCoordinator.ViewState) -> some View {
        switch viewState {
        case .onboarding(let c):
            OnboardingCoordinatorView(coordinator: c)

        case .session(let c):
            SessionCoordinatorView(coordinator: c)
        }
    }
}

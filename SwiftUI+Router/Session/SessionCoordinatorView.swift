//
//  SessionCoordinatorView.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 10.07.2024.
//

import SwiftUI

struct SessionCoordinatorView: View {

    @ObservedObject
    var coordinator: SessionCoordinator

    var body: some View {
        TabView(selection: $coordinator.currentTabIndex) {
            Group {
                FirstFeatureCoordinatorView(coordinator: coordinator.firstFeatureCoordinator)
                    .tabItem {
                        Image(uiImage: .add)
                        Text("Tab 1")
                    }
                    .tag(0)

                SecondFeatureCoordinatorView(coordinator: coordinator.secondFeatureCoordinator)
                    .tabItem {
                        Image(uiImage: .remove)
                        Text("Tab 2")
                    }
                    .tag(1)
            }
            .toolbarBackground(.indigo, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
    }
}

#Preview {
    final class Factory: SessionCoordinatorElementsFactory {
        final class Factory: FirstFeatureCoordinatorElementsFactory {
            func fullScreenCoverFeatureCoordinator() -> FullScreenCoverCoordinator {
                .init(navigation: .init())
            }
        }

        func firstFeatureCoordinator() -> FirstFeatureCoordinator {
            .init(
                navigation: .init(),
                elementsFactory: Factory()
            )
        }

        func secondFeatureCoordinator() -> SecondFeatureCoordinator { .init() }
    }

    return SessionCoordinatorView(
        coordinator: .init(
            elementsFactory: Factory()
        )
    )
}

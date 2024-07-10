//
//  FirstFeatureCoordinator.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 10.07.2024.
//

import SwiftUI

protocol FirstFeatureCoordinatorElementsFactory {
    func fullScreenCoverFeatureCoordinator() -> FullScreenCoverCoordinator
}

final class FirstFeatureCoordinator: ObservableObject {

    struct Output {
        let onFullScreen: () -> Void

        init(
            onFullScreen: @escaping () -> Void
        ) {
            self.onFullScreen = onFullScreen
        }
    }

    var output: Output?

    @Published
    var isFullScreenShowing: Bool = false

    let navigation: FirstFeatureCoordinatorNavigation
    private let elementsFactory: FirstFeatureCoordinatorElementsFactory

    init(
        navigation: FirstFeatureCoordinatorNavigation,
        elementsFactory: FirstFeatureCoordinatorElementsFactory
    ) {
        self.navigation = navigation
        self.elementsFactory = elementsFactory
    }

    func fullScreenCoordinator() -> FullScreenCoverCoordinator {
        let coordinator = elementsFactory.fullScreenCoverFeatureCoordinator()
        coordinator.output = .init(onDismiss: { [weak self] in
            self?.isFullScreenShowing.toggle()
        })

        return coordinator
    }

    func presentFullScreen() {
        isFullScreenShowing.toggle()
    }

    func pushToView1() {
        let vm = View1VM()
        vm.output = .init(
            onPush2: { [weak self] in
                self?.pushToView2()
            },
            onPush3: { [weak self] in
                self?.pushToView3()
            }
        )

        navigation.navigateTo(.view1(vm))
    }

    private func pushToView2() {
        let vm = View2VM()
        vm.output = .init(
            onPush1: { [weak self] in
                self?.pushToView1()
            },
            onPush3: { [weak self] in
                self?.pushToView3()
            }
        )

        navigation.navigateTo(.view2(vm))
    }

    private func pushToView3() {
        let vm = View3VM()
        vm.output = .init(
            onPush2: { [weak self] in
                self?.pushToView2()
            },
            onPopToRoot: { [weak self] in
                self?.navigation.popToRoot()
            },
            onBack: { [weak self] in
                self?.navigation.navigateBack()
            }
        )

        navigation.navigateTo(.view3(vm))
    }
}

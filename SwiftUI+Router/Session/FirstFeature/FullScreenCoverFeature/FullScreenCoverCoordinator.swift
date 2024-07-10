//
//  FullScreenCoverCoordinator.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 10.07.2024.
//

import Foundation

final class FullScreenCoverCoordinator: ObservableObject {
    
    struct Output {
        let onDismiss: () -> Void

        init(
            onDismiss: @escaping () -> Void
        ) {
            self.onDismiss = onDismiss
        }
    }

    var output: Output?

    let navigation: FullScreenCoverNavigation

    init(navigation: FullScreenCoverNavigation) {
        self.navigation = navigation
    }

    func onDismiss() {
        output?.onDismiss()
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

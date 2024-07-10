//
//  FullScreenCoverNavigation.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 10.07.2024.
//

import SwiftUI

final class FullScreenCoverNavigation: NavigationStorable {
    // Contains the possible destinations in our Router
    enum Screen {
        case view1(View1VM)
        case view2(View2VM)
        case view3(View3VM)
    }

    @Published
    var path: NavigationPath = NavigationPath()

    @ViewBuilder
    func view(for route: Screen) -> some View {
        switch route {
        case .view1(let vm):
            View1(viewModel: vm)
        case .view2(let vm):
            View2(viewModel: vm)
        case .view3(let vm):
            View3(viewModel: vm)
        }
    }

    func navigateTo(_ screen: Screen) {
        path.append(screen)
    }

    func navigateBack() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}

extension FullScreenCoverNavigation.Screen: Hashable {
    static func == (
        lhs: FullScreenCoverNavigation.Screen,
        rhs: FullScreenCoverNavigation.Screen
    ) -> Bool {
        switch (lhs, rhs) {
        case let (.view1(lvm), .view1(rvm)):
            return lvm === rvm
        case let (.view2(lvm), .view2(rvm)):
            return lvm === rvm
        case let (.view3(lvm), .view3(rvm)):
            return lvm === rvm
        default: return false
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case .view1(let vm):
            hasher.combine(ObjectIdentifier(vm))
        case .view2(let vm):
            hasher.combine(ObjectIdentifier(vm))
        case .view3(let vm):
            hasher.combine(ObjectIdentifier(vm))
        }
    }
}

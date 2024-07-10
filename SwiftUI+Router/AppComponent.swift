//
//  AppComponent.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 08.07.2024.
//

import Foundation
import Swinject

@MainActor
class AppComponent: BootstrapDIComponent {
    static let shared = AppComponent()

    private override init() {
        super.init()
    }

    func appCoordinator() -> AppCoordinator {
        AppCoordinator(elementsFactory: self)
    }
}

extension AppComponent: AppCoordinatorElementsFactory {
    func sessionCoordinator() -> SessionCoordinator {
        SessionComponent(parent: self)
            .sessionCoordinator()
    }
    
    func onboardingCoordinator() -> OnboardingCoordinator {
        //TODO: - define OnboardingComponent to init Onboarding dependencies
        .init()
    }
}

@MainActor
protocol DIComponentProtocol: AnyObject {
    var container: Container { get }
}

class DIComponent: DIComponentProtocol {
    var container: Container
    let parent: DIComponentProtocol

    init(parent: DIComponentProtocol) {
        self.container = Container(parent: parent.container)
        self.parent = parent

        setup(with: container)
    }

    func setup(with container: Container) {}
}

class BootstrapDIComponent: DIComponentProtocol {
    let container: Container = Container()

    init() {
        setup(with: container)
    }

    func setup(with container: Container) {}

}

extension Resolver {
    func resolve<Service>() -> Service {
        guard let service = resolve(Service.self) else {
            fatalError("Failed to resolve: \(Service.self)")
        }
        return service
    }
}

extension DIComponentProtocol {
    func resolve<Service>(_ type: Service.Type = Service.self) -> Service {
        guard let service = container.resolve(Service.self) else {
            fatalError("Failed to resolve: \(Service.self)")
        }
        return service
    }
}

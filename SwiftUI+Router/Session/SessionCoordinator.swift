//
//  SessionCoordinator.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 10.07.2024.
//

import Foundation

protocol SessionCoordinatorElementsFactory {
    func firstFeatureCoordinator() -> FirstFeatureCoordinator
    func secondFeatureCoordinator() -> SecondFeatureCoordinator
}

final class SessionCoordinator: ObservableObject {

    @Published
    var currentTabIndex = 0

    lazy var firstFeatureCoordinator: FirstFeatureCoordinator = fFeatureCoordinator()
    var secondFeatureCoordinator: SecondFeatureCoordinator

    private let elementsFactory: SessionCoordinatorElementsFactory

    init(elementsFactory: SessionCoordinatorElementsFactory) {
        self.elementsFactory = elementsFactory
        self.secondFeatureCoordinator = elementsFactory.secondFeatureCoordinator()
    }

    private func fFeatureCoordinator() -> FirstFeatureCoordinator {
        let coordinator = elementsFactory.firstFeatureCoordinator()
        coordinator.output = .init(onFullScreen: {
            print("---> OK")
        })

        return coordinator
    }

    private func sFeatureCoordinator() -> SecondFeatureCoordinator {
        //
        return .init()
    }
}

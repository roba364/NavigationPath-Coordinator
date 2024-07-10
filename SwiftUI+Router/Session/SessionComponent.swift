//
//  SessionComponent.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 10.07.2024.
//

import Foundation

class SessionComponent: DIComponent {
    func sessionCoordinator() -> SessionCoordinator {
        SessionCoordinator(elementsFactory: self)
    }
}

extension SessionComponent: SessionCoordinatorElementsFactory {

    func firstFeatureCoordinator() -> FirstFeatureCoordinator {
        FirstFeatureComponent(parent: self)
            .firstFeatureCoordinator()
    }

    func secondFeatureCoordinator() -> SecondFeatureCoordinator {
        //TODO: - create SecondFeatureComponent
        SecondFeatureCoordinator()
    }
}

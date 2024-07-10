//
//  FirstFeatureComponent.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 10.07.2024.
//

import Foundation

final class FirstFeatureComponent: DIComponent {
    func firstFeatureCoordinator() -> FirstFeatureCoordinator {
        .init(
            navigation: .init(),
            elementsFactory: self
        )
    }
}

extension FirstFeatureComponent: FirstFeatureCoordinatorElementsFactory {
    func fullScreenCoverFeatureCoordinator() -> FullScreenCoverCoordinator {
        .init(navigation: .init())
    }
}

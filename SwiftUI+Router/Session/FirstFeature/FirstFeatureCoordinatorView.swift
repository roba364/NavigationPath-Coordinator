//
//  FirstFeatureCoordinatorView.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 10.07.2024.
//

import SwiftUI

struct FirstFeatureCoordinatorView: View {

    @ObservedObject
    var coordinator: FirstFeatureCoordinator

    var body: some View {
        NavigationStorableView(navigation: coordinator.navigation) {
            Button(action: coordinator.presentFullScreen) {
                Text("Full screen cover")
            }

            Button(action: coordinator.pushToView1) {
                Text("Push to View 1")
            }
        }
        .fullScreenCover(isPresented: $coordinator.isFullScreenShowing) {
            FullScreenCoverCoordinatorView(
                coordinator: coordinator.fullScreenCoordinator()
            )
        }
    }
}

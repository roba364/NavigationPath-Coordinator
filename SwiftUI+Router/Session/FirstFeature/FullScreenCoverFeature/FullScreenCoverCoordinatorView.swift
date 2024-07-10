//
//  FullScreenCoverCoordinatorView.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 10.07.2024.
//

import SwiftUI

struct FullScreenCoverCoordinatorView: View {
    @ObservedObject
    var coordinator: FullScreenCoverCoordinator

    var body: some View {
        NavigationStorableView(navigation: coordinator.navigation) {
            VStack(spacing: 40) {
                Button(action: coordinator.onDismiss) {
                    Text("onDismiss")
                }

                Button(action: coordinator.pushToView1) {
                    Text("Push to View 1")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.opacity(0.1))
        }
    }
}

#Preview {
    FullScreenCoverCoordinatorView(
        coordinator: .init(
            navigation: .init()
        )
    )
}

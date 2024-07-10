//
//  ContentView.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 08.07.2024.
//

import SwiftUI

struct ContentView: View {

    @StateObject
    private var coordinator: AppCoordinator = AppComponent.shared.appCoordinator()

    var body: some View {
        AppCoordinatorView(coordinator: coordinator)
    }
}

#Preview {
    ContentView()
}

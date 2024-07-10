//
//  SecondFeatureCoordinatorView.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 10.07.2024.
//

import SwiftUI

struct SecondFeatureCoordinatorView: View {

    @ObservedObject
    var coordinator: SecondFeatureCoordinator

    var body: some View {
        VStack {
            Text("Second feature coordinator")
        }
    }
}

#Preview {
    SecondFeatureCoordinatorView(coordinator: .init())
}

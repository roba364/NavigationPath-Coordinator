//
//  View3.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 08.07.2024.
//

import SwiftUI

struct View3: View {
    @ObservedObject
    var viewModel: View3VM

    var body: some View {
        VStack() {
            Button("Go to View B") {
                viewModel.pushToView2()
            }
            Button("Go back") {
                viewModel.goBack()
            }
            Button("Pop to Root") {
                viewModel.popToRoot()
            }
        }
        .navigationTitle("View 3")
    }
}

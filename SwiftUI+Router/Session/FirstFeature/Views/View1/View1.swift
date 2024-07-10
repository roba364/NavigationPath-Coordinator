//
//  View1.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 08.07.2024.
//

import SwiftUI

struct View1: View {

    @ObservedObject
    var viewModel: View1VM

    var body: some View {
        VStack() {
            Button("Go to View 2") {
                viewModel.pushToView2()
            }
            Button("Go to View 3") {
                viewModel.pushToView3()
            }
        }
        .navigationTitle("View 1")
    }
}

#Preview {
    View1(viewModel: .init())
}

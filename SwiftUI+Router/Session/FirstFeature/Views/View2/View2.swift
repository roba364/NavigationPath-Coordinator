//
//  View2.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 08.07.2024.
//

import SwiftUI

struct View2: View {
    @ObservedObject
    var viewModel: View2VM

    var body: some View {
        VStack {
            Button("Go to View 1") {
                viewModel.pushToView1()
            }
            Button("Go to View 3") {
                viewModel.pushToView3()
            }
        }
        .navigationTitle("View 2")
    }
}

#Preview {
    View2(viewModel: .init())
}

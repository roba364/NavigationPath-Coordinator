//
//  OnboardingStepView.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 10.07.2024.
//

import SwiftUI

struct OnboardingStepView: View {

    let text: String
    let onNext: () -> Void

    var body: some View {
        VStack {
            Button(action: onNext) {
                Text(text)
                    .font(.headline)
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    OnboardingStepView(text: "", onNext: {})
}

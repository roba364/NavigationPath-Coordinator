//
//  View3VM.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 08.07.2024.
//

import Foundation

final class View3VM: ObservableObject {

    struct Output {
        let onPush2: () -> Void
        let onPopToRoot: () -> Void
        let onBack: () -> Void
    }

    var output: Output?

    func pushToView2() {
        output?.onPush2()
    }

    func popToRoot() {
        output?.onPopToRoot()
    }

    func goBack() {
        output?.onBack()
    }
}

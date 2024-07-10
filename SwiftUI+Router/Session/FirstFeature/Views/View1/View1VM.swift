//
//  View1VM.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 08.07.2024.
//

import Foundation

final class View1VM: ObservableObject {

    struct Output {
        let onPush2: () -> Void
        let onPush3: () -> Void
    }

    var output: Output?

    func pushToView2() {
        output?.onPush2()
    }

    func pushToView3() {
        output?.onPush3()
    }
}

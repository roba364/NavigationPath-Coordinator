//
//  View2VM.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 08.07.2024.
//

import Foundation

final class View2VM: ObservableObject {

    struct Output {
        let onPush1: () -> Void
        let onPush3: () -> Void
    }

    var output: Output?

    func pushToView1() {
        output?.onPush1()
    }

    func pushToView3() {
        output?.onPush3()
    }
}

//
//  Router.swift
//  SwiftUI+Router
//
//  Created by Sergey Borovkov on 08.07.2024.
//

import SwiftUI

protocol NavigationStorable: ObservableObject {
    associatedtype Screen: Hashable
    associatedtype DestinationView: View
    
    var path: NavigationPath { get set }
    func view(for screen: Screen) -> DestinationView
    func navigateTo(_ screen: Screen)
    func navigateBack()
    func popToRoot()
}

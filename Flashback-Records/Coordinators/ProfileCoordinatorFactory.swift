//
//  ProfileCoordinatorFactory.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 08/06/2026.
//
import NavigateCoordinator

protocol ProfileCoordinatorFactory {
    func makeProfileCoordinator(navigator: Navigator) -> Coordinator
}

extension DependencyContainer: ProfileCoordinatorFactory {
    func makeProfileCoordinator(navigator: Navigator) -> Coordinator {
        ProfileCoordinator(navigator: navigator, factory : self)
    }
}

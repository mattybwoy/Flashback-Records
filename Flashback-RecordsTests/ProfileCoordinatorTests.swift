//
//  ProfileCoordinatorTests.swift
//  Flashback-RecordsTests
//
//  Created by Matthew Lock on 06/07/2026.
//

import XCTest
import UIKit
import NavigateCoordinator
@testable import Flashback_Records

@MainActor
final class ProfileCoordinatorTests: XCTestCase {

    private var window: UIWindow!

    override func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)
    }

    override func tearDown() {
        UIView.setAnimationsEnabled(true)
        window = nil
        super.tearDown()
    }

    private func makeSut() -> (ProfileCoordinator, BasicNavigationController) {
        let navigationController = BasicNavigationController()
        window = UIWindow()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        let navigator = BasicNavigator(navigationController: navigationController)
        let coordinator = ProfileCoordinator(navigator: navigator, factory: DependencyContainer())
        return (coordinator, navigationController)
    }

    func testStartShowsProfileScreen() {
        let (coordinator, navigationController) = makeSut()

        coordinator.start(transition: .push(animated: false), onDismissed: nil)

        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertTrue(navigationController.topViewController is ProfileViewController<ProfileView>)
    }

    func testSignupTappedPushesAccountCreation() {
        let (coordinator, navigationController) = makeSut()
        coordinator.start(transition: .push(animated: false), onDismissed: nil)

        coordinator.signupTapped()

        XCTAssertEqual(navigationController.viewControllers.count, 2)
        XCTAssertTrue(navigationController.topViewController is AccountCreationViewController<AccountCreationView>)
    }

    func testSigninTappedPushesAccountLogin() {
        let (coordinator, navigationController) = makeSut()
        coordinator.start(transition: .push(animated: false), onDismissed: nil)

        coordinator.signinTapped()

        XCTAssertEqual(navigationController.viewControllers.count, 2)
        XCTAssertTrue(navigationController.topViewController is AccountLoginViewController<AccountLoginView>)
    }

    func testReturnToProfileFromAccountCreationPopsBack() {
        let (coordinator, navigationController) = makeSut()
        coordinator.start(transition: .push(animated: false), onDismissed: nil)
        coordinator.signupTapped()

        let child = coordinator.childCoordinators.first as? AccountCreationCoordinator
        child?.returnToProfileScreen()
        RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.05))

        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertTrue(navigationController.topViewController is ProfileViewController<ProfileView>)
    }

    func testReturnToProfileFromAccountLoginPopsBack() {
        let (coordinator, navigationController) = makeSut()
        coordinator.start(transition: .push(animated: false), onDismissed: nil)
        coordinator.signinTapped()

        let child = coordinator.childCoordinators.first as? AccountLoginCoordinator
        child?.returnToProfileScreen()
        RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.05))

        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertTrue(navigationController.topViewController is ProfileViewController<ProfileView>)
    }
}

//
//  MainViewController.swift
//  SB-MDEditor
//
//  Created by SERGEY SHLYAKHIN on 18.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MainDisplayLogic: AnyObject {
	func displaySomething(viewModel: Main.Something.ViewModel)
}

final class MainViewController: UIViewController, MainDisplayLogic {
	var interactor: MainBusinessLogic?
	var router: (NSObjectProtocol & MainRoutingLogic & MainDataPassing)?

	private lazy var errorView = ErrorView()

	init(
		interactor: MainBusinessLogic,
		router: (NSObjectProtocol & MainRoutingLogic & MainDataPassing)
	) {
		self.interactor = interactor
		self.router = router
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	// MARK: View lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

		setup()
		applyStyle()
		setupConstraints()

		doSomething()
	}

	// MARK: Do something
	func doSomething() {
		let request = Main.Something.Request()
		interactor?.doSomething(request: request)
	}

	func displaySomething(viewModel: Main.Something.ViewModel) {}
}

// MARK: - UI
private extension MainViewController {
	func setup() {
		let testMessage = ErrorInputData(
			emoji: "🙈",
			message: "Переход к экрану: О приложении"
		) { [weak self] in
			self?.router?.navigate(.toAbout)
		}
		errorView.update(with: testMessage)
		errorView.show()
	}
	func applyStyle() {
		title = Appearance.title
		view.backgroundColor = Theme.color(usage: .background)
	}
	func setupConstraints() {
		[
			errorView
		].forEach { item in
			item.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview(item)
		}

		errorView.makeEqualToSuperview()
	}
}

// MARK: - Appearance
private extension MainViewController {
	enum Appearance {
		static let title = "MD Editor"
	}
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ViewProvider3: PreviewProvider {
	static var previews: some View {
		let rootViewController = RootViewController()
		let di = Di(rootVC: rootViewController)
		rootViewController.factory = di
		// swiftlint:disable:next force_unwrapping
		let viewController = rootViewController.factory!.makeMainModule().viewController
		return viewController.preview()
	}
}
#endif
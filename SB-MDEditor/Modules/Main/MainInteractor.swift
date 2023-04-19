//
//  MainInteractor.swift
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

protocol MainBusinessLogic {
	func doSomething(request: Main.Something.Request)
}

protocol MainDataStore {
	// var name: String { get set }
}

final class MainInteractor: MainBusinessLogic, MainDataStore {
	private let presenter: MainPresentationLogic
	private let worker: MainWorker

	init(presenter: MainPresentationLogic, worker: MainWorker) {
		self.presenter = presenter
		self.worker = worker
	}

	// MARK: Do something

	func doSomething(request: Main.Something.Request) {
		worker.doSomeWork()

		let response = Main.Something.Response()
		presenter.presentSomething(response: response)
	}
}
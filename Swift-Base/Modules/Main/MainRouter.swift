//
//  MainRouter.swift
//  Swift-Base
//
//  Created by SERGEY SHLYAKHIN on 18.04.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MainRoutingLogic: MainRouting {
	// func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol MainDataPassing {
	var dataStore: MainDataStore? { get }
}

final class MainRouter: NSObject, MainRoutingLogic, MainDataPassing {
	weak var view: IRootViewController?

	weak var viewController: MainViewController?
	var dataStore: MainDataStore?

	// MARK: Routing

	// MARK: Navigation

	// func navigateToSomewhere(source: MainViewController, destination: SomewhereViewController)
	// {
	//  source.show(destination, sender: nil)
	// }

	// MARK: Passing data

	// func passDataToSomewhere(source: MainDataStore, destination: inout SomewhereDataStore)
	// {
	//  destination.name = source.name
	// }
}
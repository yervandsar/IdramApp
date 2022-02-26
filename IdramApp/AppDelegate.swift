//
//  AppDelegate.swift
//  IdramApp
//
//  Created by Yervand Saribekyan on 20.02.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		setupIdram()
		return true
	}

	func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
		IdramListener.listen(link: url)
		return true
	}

	func setupIdram() {
		IdramApp.setAccount("123456789")
		IdramApp.setCallbackScheme("idram-app-demo")
		IdramListener.setDelegate(self)
	}


}

extension AppDelegate: IdramListernerDelegate {
	func didSuccessIdramPayment(with response: IdramResponse) {
		print(response)
	}

	func didFailedIdramPayment(with response: IdramResponse) {
		dump(response)
	}
}

//
//  IdramManager.swift
//  IdramApp
//
//  Created by Yervand Saribekyan on 20.02.22.
//

import Foundation
import UIKit

/// IdramManager declaration.
public struct IdramManager {

	/// Deeplink to Idram app in App Store
	private static let AppStoreLink = "itms-apps://apple.com/app/id558788989"
	/// Deeplink to Idram App
	private static let IdramAppLink = "idramapp://payment"

	/// Checks Idram's application availability to handle payment deeplink.
	public static var canOpenApp: Bool { DeeplinkManager.canOpen(deeplink: IdramAppLink) }

	/// Opens Idram page in App Store
	public static func openInAppStore() {
		DispatchQueue.main.async {
			guard let url = URL(string: AppStoreLink), UIApplication.shared.canOpenURL(url) else { return }
			UIApplication.shared.open(url, options: [:], completionHandler: nil)
		}
	}
}

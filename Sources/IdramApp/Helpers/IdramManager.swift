//
//  IdramManager.swift
//  IdramApp
//
//  Created by Yervand Saribekyan on 20.02.22.
//

import Foundation
import UIKit

public struct IdramManager {
	internal static let AppStoreLink = "itms-apps://apple.com/app/id558788989"
	internal static let IdramAppLink = "idramapp://payment"

	public static var canOpenApp: Bool { canOpen(deeplink: IdramAppLink) }

	public static func openInAppStore() {
		DispatchQueue.main.async {
			guard let url = URL(string: AppStoreLink), UIApplication.shared.canOpenURL(url) else { return }
			UIApplication.shared.open(url, options: [:], completionHandler: nil)
		}
	}

	public static func open(deeplink: String) {
		DispatchQueue.main.async {
			guard let url = URL(string: deeplink) else { return }
			open(deeplink: url)
		}
	}

	public static func open(deeplink url: URL) {
		DispatchQueue.main.async {
			guard UIApplication.shared.canOpenURL(url) else { return }
			UIApplication.shared.open(url, options: [:], completionHandler: nil)
		}
	}
}

internal extension IdramManager {
	static func canOpen(deeplink: String) -> Bool {
		guard let url = URL(string: deeplink) else { return false }
		return UIApplication.shared.canOpenURL(url)
	}
}

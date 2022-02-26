//
//  DeeplinkManager.swift
//  IdramApp
//
//  Created by Yervand Saribekyan on 26.02.22.
//

import Foundation
import UIKit

/// DeeplinkManager declaration.
public struct DeeplinkManager {

	/// Opens link if available
	/// - Parameter deeplink: Deeplink to handle. `String`
	public static func open(deeplink urlString: String) {
		DispatchQueue.main.async {
			guard let url = URL(string: urlString) else { return }
			open(deeplink: url)
		}
	}

	/// Opens link if available
	/// - Parameter deeplink: Deeplink to handle. `URL`
	public static func open(deeplink url: URL) {
		DispatchQueue.main.async {
			guard UIApplication.shared.canOpenURL(url) else { return }
			UIApplication.shared.open(url, options: [:], completionHandler: nil)
		}
	}

	/// Checks availability for given link
	/// - Parameter deeplink: Deeplink to handle. `String`
	/// - Returns: Can handle given deeplink or not. `Bool`
	public static func canOpen(deeplink urlString: String) -> Bool {
		guard let url = URL(string: urlString) else { return false }
		return canOpen(deeplink: url)
	}

	/// Checks availability for given link
	/// - Parameter deeplink: Deeplink to handle. `String`
	/// - Returns: Can handle given deeplink or not. `Bool`
	public static func canOpen(deeplink url: URL) -> Bool {
		UIApplication.shared.canOpenURL(url)
	}
}


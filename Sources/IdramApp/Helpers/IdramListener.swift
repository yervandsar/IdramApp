//
//  IdramListener.swift
//  IdramApp
//
//  Created by Yervand Saribekyan on 20.02.22.
//

import Foundation

/// IdramListernerDelegate
public protocol IdramListernerDelegate: AnyObject {
	/// Succeed with response. `IdramResponse`
	func didSuccessIdramPayment(with response: IdramResponse)
	/// Failed with response. `IdramResponse`
	func didFailedIdramPayment(with response: IdramResponse)
}

/// Idram Listener Declaration
public class IdramListener {

	/// Shared Instance
	internal static let shared = IdramListener()

	/// IdramListernerDelegate
	public weak var delegate: IdramListernerDelegate?

	private init() {
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(didReceiveIdramResponse(_:)),
			name: .didReceiveIdramResponse,
			object: nil
		)
	}

	deinit {
		NotificationCenter.default.removeObserver(self, name: .didReceiveIdramResponse, object: nil)
	}


	@objc private func didReceiveIdramResponse(_ notification: Notification) {
		guard let link = notification.object as? URL else { return }
		let response = IdramResponse(link: link)
		if response.success {
			delegate?.didSuccessIdramPayment(with: response)
		} else {
			delegate?.didFailedIdramPayment(with: response)
		}
	}

	/// Response listener
	/// - Parameter link: Response URL
	public static func listen(link: URL) {
		guard link.host == "payment" && link.path == "/idram" else { return }
		NotificationCenter.default.post(name: .didReceiveIdramResponse, object: link)
	}

	/// Set Delegate to listen responses
	/// - Parameter delegate: IdramListernerDelegate
	public static func setDelegate(_ delegate: IdramListernerDelegate) {
		IdramListener.shared.delegate = delegate
	}
}

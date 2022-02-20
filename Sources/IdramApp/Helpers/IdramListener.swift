//
//  IdramListener.swift
//  IdramApp
//
//  Created by Yervand Saribekyan on 20.02.22.
//

import Foundation

public protocol IdramListernerDelegate: AnyObject {
	func didSuccessPayment(_ idramResponse: IdramResponse)
	func didFailurePayment(_ idramResponse: IdramResponse)
}

public class IdramListener {
	internal static let shared = IdramListener()

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
			delegate?.didSuccessPayment(response)
		} else {
			delegate?.didFailurePayment(response)
		}
	}

	public static func listen(link: URL) {
		guard link.host == "payment" && link.path == "/idram" else { return }
		NotificationCenter.default.post(name: .didReceiveIdramResponse, object: link)
	}

	public static func setDelegate(_ delegate: IdramListernerDelegate) {
		IdramListener.shared.delegate = delegate
	}
}

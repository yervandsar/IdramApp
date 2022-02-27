//
//  IdramConfig.swift
//  IdramApp
//
//  Created by Yervand Saribekyan on 20.02.22.
//

import Foundation

/// Idram Config declaration.
public struct IdramConfig {
	/// User's Idram Id. (EDP_REC_ACCOUNT)
	public let account: String

	/// URL Scheme for redirection after payment response
	public let callbackScheme: String

	/// Initializer
	/// - Parameters:
	///   - account: User's Idram Id. (EDP_REC_ACCOUNT)
	///   - callbackScheme: URL Scheme for redirection after payment response
	public init(account: String, callbackScheme: String) {
		self.account = account
		self.callbackScheme = callbackScheme
	}
}

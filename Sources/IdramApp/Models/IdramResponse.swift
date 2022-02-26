//
//  IdramResponse.swift
//  IdramApp
//
//  Created by Yervand Saribekyan on 20.02.22.
//

import Foundation

/// Idram Response declaration.
public struct IdramResponse {

	/// Is Response Success
	public let success: Bool

	/// Unique id for payment identification of merchant billing. (EDP_BILL_NO)
	public let receiverId: String?

	/// Idram Error in case of failure
	public let error: IdramError?

	/// Tip amount if enabled
	public let tip: String?

	/// Initializer by URL
	/// - Parameter link: Response URL from Idram App
	internal init(link: URL) {
		let errorCode = link.queryParameters?["error"]
		self.error = IdramError(code: Int(errorCode ?? "-1") ?? -1)
		self.success = self.error == nil
		self.receiverId = link.queryParameters?["receiverId"]
		self.tip = link.queryParameters?["tip"]
	}
}

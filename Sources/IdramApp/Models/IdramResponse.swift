//
//  IdramResponse.swift
//  IdramApp
//
//  Created by Yervand Saribekyan on 20.02.22.
//

import Foundation

public struct IdramResponse {
	public let success: Bool

	public let receiverId: String?
	public let error: IdramError?
	public let tip: String?

	internal init(link: URL) {
		let errorCode = link.queryParameters?["error"]
		self.error = IdramError(code: Int(errorCode ?? "-1") ?? -1)
		self.success = self.error == nil
		self.receiverId = link.queryParameters?["receiverId"]
		self.tip = link.queryParameters?["tip"]
	}
}

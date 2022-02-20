//
//  IdramLink.swift
//  IdramApp
//
//  Created by Yervand Saribekyan on 20.02.22.
//

import Foundation

public struct IdramLink {
	public let receiverName: String
	public let billNumber: String
	public let amount: Double
	public let hasTip: Bool

	public init(receiverName: String, billNumber: String, amount: Double, hasTip: Bool = false) {
		self.receiverName = receiverName
		self.billNumber = billNumber
		self.amount = amount
		self.hasTip = hasTip
	}
}

public extension IdramLink {
	var deeplink: String {
		var components = URLComponents()
		components.scheme = "idramapp"
		components.host = "payment"
		var queryItems = [
			URLQueryItem(name: "receiverName", value: receiverName),
			URLQueryItem(name: "receiverId", value: IdramApp.session.account),
			URLQueryItem(name: "title", value: billNumber),
			URLQueryItem(name: "amount", value: "\(amount)"),
		]
		if let scheme = IdramApp.session.callbackScheme {
			queryItems.append(URLQueryItem(name: "callbackUrlScheme", value: scheme))
		}
		if hasTip {
			queryItems.append(URLQueryItem(name: "tip", value: "0"))
		}
		components.queryItems = queryItems
		return components.string ?? ""
	}

	func run() {
		IdramManager.open(deeplink: deeplink)
	}
}

//
//  IdramLink.swift
//  IdramApp
//
//  Created by Yervand Saribekyan on 20.02.22.
//

import Foundation

/// IdramLink Declaration.
public struct IdramLink {

	/// Any Name to display in payment page
	public let receiverName: String

	/// Unique id for payment identification of merchant billing. (EDP_BILL_NO)
	public let billNumber: String

	/// Amount to pay
	public let amount: Double

	/// Ability to get Tip
	public let hasTip: Bool

	/// Initializer
	/// - Parameters:
	///   - receiverName: Any Name to display in payment page
	///   - billNumber: Unique id for payment identification of merchant billing. (EDP_BILL_NO)
	///   - amount: Amount to pay
	///   - hasTip: Ability to get Tip
	public init(receiverName: String, billNumber: String, amount: Double, hasTip: Bool = false) {
		self.receiverName = receiverName
		self.billNumber = billNumber
		self.amount = amount
		self.hasTip = hasTip
	}
}

public extension IdramLink {

	/// Generated deeplink from given parameters
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

	/// Runs payment flow with given parameters
	func run() {
		DeeplinkManager.open(deeplink: deeplink)
	}
}

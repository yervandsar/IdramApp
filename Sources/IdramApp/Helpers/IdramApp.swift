//
//  IdramApp.swift
//  IdramApp
//
//  Created by Yervand Saribekyan on 20.02.22.
//

import Foundation

final public class IdramApp {

	internal static let session: IdramApp = IdramApp()

	private let idramQueue = DispatchQueue(label: "IdramApp-session-queue")

	private var _account: String?
	private var _callbackScheme: String?

	public var account: String {
		guard let _account = _account else {
			fatalError("""
\n‼️Idram Error‼️
Account code is required for identification your server
    1. Set account code in IdramConfig, and call IdramApp.configure({IdramConfig}) after your app's lunch
    2. Or directly set account with IdramApp.setAccount({Account Code}) after your app's lunch
""")
		}
		return _account
	}

	public var callbackScheme: String? {
		if _callbackScheme == nil {
			print("""
\n⚠️Idram Warning⚠️
Callback scheme is important if you want open back your app after idram payment
	1. Set callback scheme in IdramConfig, and call IdramApp.configure({IdramConfig}) after your app's lunch
	2. Or directly set account with IdramApp.setCallbackScheme({Callback Scheme}) after your app's lunch
""")
		}
		return _callbackScheme
	}

	private init() { }

	public static func configure(_ config: IdramConfig) {
		session.idramQueue.sync {
			session._account = config.account
			session._callbackScheme = config.callbackScheme
		}
	}

	public static func setAccount(_ account: String) {
		session.idramQueue.sync {
			session._account = account
		}
	}

	public static func setCallbackScheme(_ callbackScheme: String) {
		session.idramQueue.sync {
			session._callbackScheme = callbackScheme
		}
	}
}

extension IdramApp: CustomStringConvertible {
	public var description: String {
		"Idram Account: \(account)\n Idram Callback Scheme: \(callbackScheme ?? "nil")"
	}
}

//
//  IdramError.swift
//  IdramApp
//
//  Created by Yervand Saribekyan on 20.02.22.
//

import Foundation

/// Idram Error declaration.
/// Custom error type for handling payment errors.
public enum IdramError: Error {

	case cancelledByUser
	case noAccount
	case unavailable
	case unknown

	init?(code: Int) {
		switch code {
		case 0:
			return nil // Success returns with Error Code 0 from Idram app
		case Self.cancelledByUser.code:
			self = Self.cancelledByUser
		case Self.noAccount.code:
			self = Self.noAccount
		case Self.unavailable.code:
			self = Self.unavailable
		default:
			self = Self.unknown
		}
	}

	var code: Int {
		switch self {
		case .cancelledByUser:
			return 110099
		case .noAccount:
			return 110012
		case .unavailable:
			return 110043
		case .unknown:
			return -1
		}
	}
}

public extension IdramError {
	/// Idram Error Message
	var message: String {
		switch self {
		case .cancelledByUser:
			return "Operation is canceled by user"
		case .noAccount:
			return "Idram ID recipient does not exist or is blocked."
		case .unavailable:
			return "The service is currently unavailable. Please, try again later."
		case .unknown:
			return "Something went wrong"
		}
	}
}

extension IdramError: CustomStringConvertible {
	public var description: String {
		"Idram Error: \(message)"
	}
}

extension IdramError: CustomDebugStringConvertible {
	public var debugDescription: String  {
		"Idram Error \nCode: \(code)\nMessage: \(message)"
	}
}


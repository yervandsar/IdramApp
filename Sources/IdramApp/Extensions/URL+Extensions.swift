//
//  URL+Extensions.swift
//  IdramApp
//
//  Created by Yervand Saribekyan on 20.02.22.
//

import Foundation

public extension URL {

	var queryParameters: [String: String]? {
		guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false),
				let queryItems = components.queryItems else { return nil }

		var items: [String: String] = [:]

		for queryItem in queryItems {
			items[queryItem.name] = queryItem.value
		}

		return items
	}

}

//
//  ViewController.swift
//  IdramApp
//
//  Created by Yervand Saribekyan on 20.02.22.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

	}

	@IBAction func payButtonTapped(_ sender: Any) {
		guard IdramManager.canOpenApp else {
			showAlert(message: "Download Idram first", buttonTitle: "Ok") { _ in
				IdramManager.openInAppStore()
			}
			return
		}
		let link = IdramLink(receiverName: "Demo App", billNumber: "1234", amount: 1, hasTip: true)
		link.run()
	}

}

extension UIViewController {
	func showAlert(
		message: String?,
		buttonTitle: String? = nil,
		handler: ((UIAlertAction) -> Void)? = nil
	) {
		let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: buttonTitle, style: .default, handler: handler)
		alertController.addAction(action)
		present(alertController, animated: true, completion: nil)
	}
}

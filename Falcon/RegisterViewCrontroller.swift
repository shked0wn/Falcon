//
//  RegisterViewCrontroller.swift
//  Falcon
//
//  Created by Floran Pagliai on 14/02/2016.
//  Copyright © 2016 Falcon. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
	
	// MARK: Properties
	var ref: FirebaseManager!
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	// MARK: UIViewController Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		ref = FirebaseManager()
		
		emailTextField.autocorrectionType = UITextAutocorrectionType.No
	}
	
	// MARK: Actions
	@IBAction func registerAction(sender: UIButton) {
		let userData = [
			"provider": "pasword",
			"username": usernameTextField.text!,
			"email": emailTextField.text!
		]
		ref.registerUser(
			userData,
			password: passwordTextField.text!) {
				(error) -> Void in
				if (!error) {
					self.performSegueWithIdentifier("Logged", sender: nil)
				}
		}
	}
}
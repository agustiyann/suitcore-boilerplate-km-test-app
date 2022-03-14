//
//  FirstScreenViewController.swift
//  SMV-iper
//
//  Created by Agus Tiyansyah Syam on 07/03/22.
//  Copyright © 2022 Rifat Firdaus. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldPalindrome: UITextField!
    @IBOutlet weak var buttonCheck: UIButton!
    @IBOutlet weak var buttonNext: UIButton!

    private var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        textFieldName.delegate = self
        textFieldPalindrome.delegate = self
        textFieldName.layer.cornerRadius = 12
        textFieldName.clipsToBounds = true
        textFieldPalindrome.layer.cornerRadius = 12
        textFieldPalindrome.clipsToBounds = true
        buttonCheck.layer.cornerRadius = 12
        buttonNext.layer.cornerRadius = 12
    }

    @IBAction func checkPressed(_ sender: UIButton) {
        if let text = textFieldPalindrome.text {
            showIsPalindrome(text: text)
        }
    }

    func showIsPalindrome(text: String) {
        var message = ""
        if text.isPalindrome {
            message = "is Palindrome"
        } else {
            message = "is not Palindrome"
        }
        let alert = UIAlertController(
            title: message,
            message: "text \(message)",
            preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

    @IBAction func nextPressed(_ sender: UIButton) {
        if let name = textFieldName.text {
            let secondScreen = SecondScreenViewController()
            secondScreen.name = name
            navigationController?.pushViewController(secondScreen, animated: true)
        }
    }
}

extension FirstScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

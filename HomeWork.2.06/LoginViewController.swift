//
//  LoginViewController.swift
//  HomeWork.2.06
//
//  Created by Alexander Shevtsov on 12.04.2024.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet private var userNameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    
    private let user = "User"
    private let password = "123"
    
    // Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.user = user
    }
    
    // Скрытие клавиатуры
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true) // скрытие
    }
    
    // Проверка данных
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == user, passwordTextField.text == password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField // обнуления поля пароля
            )
            return false
        }
        return true
    }
    
    // вывод ошибки через tag
    @IBAction func forgotRegisterDate(_ sender: UIButton) {
        sender.tag == 0 // тернарный
        ? showAlert(title: "Oops!", message: "Your name is \(user)")
        : showAlert(title: "Oops!", message: "Your password is \(password)")
    }
    
    // обнуление текстовых полей при возврате по сигвею
    @IBAction func unwind(for sender: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }

    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


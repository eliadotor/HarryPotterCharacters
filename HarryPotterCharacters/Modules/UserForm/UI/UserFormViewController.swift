//
//  UserFormViewController.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 31/1/22.
//

import UIKit

struct UserFormViewModel {
    let name:String?
    let phone:String?
    let mail: String?
    let data: String?
}

class UserFormViewController: UIViewController, UserFormContract {
    
    @IBOutlet weak var nameInput: UITextField!

    @IBOutlet weak var phoneInput: UITextField!

    @IBOutlet weak var mailInput: UITextField!
    

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var userDataTextArea: UITextView!
    
    var presenter: UserFormPresenterContract?
    
    @IBAction func scrollViewTapped(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func scrollViewTapGesture(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func locationPermission(_ sender: UISwitch) {
    }
    
    @IBAction func sendPressed(_ sender: Any) {
        presenter?.didPressSend()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotifications()
        [mailInput,phoneInput, nameInput].forEach { input in
            input?.delegate = self
        }
        userDataTextArea.delegate = self
        presenter?.didLoad()
        
    }
    
    
   
    @IBAction func inputChanged(_ textField: UITextField) {
        textFieldDidChange(textField)
    }
    
    
    private func textFieldDidChange(_ textField: UITextField) {
        switch textField {
            case nameInput: presenter?.didUpdateName(textField.text)
            case phoneInput: presenter?.didUpdatePhone(textField.text)
            case mailInput: presenter?.didUpdateMail(textField.text)
            default: break
           
        }
    }
    
    func configure(with viewModel: UserFormViewModel) {
        DispatchQueue.main.async {
            self.nameInput.text = viewModel.name
            self.phoneInput.text = viewModel.phone
            self.mailInput.text = viewModel.mail
            self.userDataTextArea.text = viewModel.data
        }
    }
    
    func didValidateName(_ valid: Bool) {
        didUpdateValidation(input: nameInput, valid: valid)
    }
    
    func didValidatePhone(_ valid: Bool) {
        didUpdateValidation(input: phoneInput, valid: valid)
    }
    
    func didValidateMail(_ valid: Bool) {
        didUpdateValidation(input: mailInput, valid: valid)
    }
    
    func showValidationError() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error de validación", message: "Por favor revisa los campos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    private func didUpdateValidation(input: UITextField, valid: Bool) {
        DispatchQueue.main.async {
            input.layer.borderWidth = 1.0
            input.layer.borderColor = valid ? UIColor.systemGreen.cgColor : UIColor.systemRed.cgColor
        }
    }
    
    func registerNotifications() {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }

        @objc func keyboardWillShow(notification: NSNotification){
            guard let keyboardFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            scrollView.contentInset.bottom = view.convert(keyboardFrame.cgRectValue, from: nil).size.height
        }

        @objc func keyboardWillHide(notification: NSNotification){
            scrollView.contentInset.bottom = 0
        }
        deinit {
            print("deinit \(self)")
        }
    
}

extension UserFormViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        presenter?.didUpdateData(textView.text)
    }
}

extension UserFormViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textFieldDidChange(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameInput: phoneInput.becomeFirstResponder()
        case phoneInput: mailInput.becomeFirstResponder()
        case mailInput: textField.resignFirstResponder()
        default: break
        }
        return true
    }
}

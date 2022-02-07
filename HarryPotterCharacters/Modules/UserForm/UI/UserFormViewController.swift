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

class UserFormViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "user_form_title".localized
        }
    }
    
    @IBOutlet weak var subheadLabel: UILabel! {
        didSet {
            subheadLabel.text = "user_form_subhead".localized
        }
    }
    
    @IBOutlet weak var nameInput: UITextField! 
    @IBOutlet weak var phoneInput: UITextField!
    @IBOutlet weak var mailInput: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = "user_form_name_label".localized
        }
    }
    
    @IBOutlet weak var phoneLabel: UILabel! {
        didSet {
            phoneLabel.text = "user_form_phone_label".localized
        }
    }
    
    @IBOutlet weak var mailLabel: UILabel! {
        didSet {
            mailLabel.text = "user_form_mail_label".localized
        }
    }
    
    @IBOutlet weak var aboutLabel: UILabel! {
        didSet {
            aboutLabel.text = "user_form_user_data_label".localized
        }
    }
    
    @IBOutlet weak var userDataTextArea: UITextView!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var permissionLabel: UILabel! {
        didSet {
            permissionLabel.text = "permission_label".localized
        }
    }
    
    @IBOutlet weak var infoLabel: UILabel! {
        didSet {
            infoLabel.text = "permission_info".localized
        }
    }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.setTitle("user_form_button_text".localized, for: .normal) 
        }
    }
    
    var presenter: UserFormPresenterContract?
    
    var permissionsPresenter: PermissionsPresenterContract?
    
    @IBAction func scrollViewTapped(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func scrollViewTapGesture(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var scrollView: UIScrollView!

    @IBAction func locationPermission(_ sender: UISwitch) {
        permissionsPresenter?.didPressPermissionsSwitch()
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
        presenter?.view = self
        permissionsPresenter?.view = self
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
}

extension UserFormViewController: UserFormContract {
    func didValidateName(_ valid: Bool) {
        didUpdateValidation(input: nameInput, valid: valid)
    }
    
    func didValidatePhone(_ valid: Bool) {
        didUpdateValidation(input: phoneInput, valid: valid)
    }
    
    func didValidateMail(_ valid: Bool) {
        didUpdateValidation(input: mailInput, valid: valid)
    }
    func showConfirmation() {
        showNotification(title: "user_form_alert_title".localized, message: "user_form_alert_message".localized, textButton: "user_form_alert_button".localized)
    }
    
    func showValidationError() {
        showNotification(title: "user_form_error_alert_title".localized, message: "user_form_error_alert_message".localized, textButton: "user_form_alert_button".localized)
    }
    
    func showNotification(title: String, message: String, textButton: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: textButton, style: .default))
            self.present(alert, animated: true)
        }
    }

    
    func setAllowed() {
        DispatchQueue.main.async {
            self.switchButton.isEnabled = false
            self.permissionLabel.text = "permission_label_allow".localized
            self.switchButton.isOn = true
            self.infoLabel.text = "permission_info_allow".localized
        }
    }
    
    func setNotAllowed() {
        DispatchQueue.main.async {
            self.switchButton.isEnabled = true
            self.permissionLabel.text = "permission_label".localized
            self.switchButton.isOn = false
            self.infoLabel.text = "permission_info".localized
        }
    }
    
    func openSettings() {
        DispatchQueue.main.async {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        }
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

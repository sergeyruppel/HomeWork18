//
//  ChangeDataViewController.swift
//  ContactList
//
//  Created by Sergey Ruppel on 25.09.2023.
//

import UIKit

final class ChangeDataViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var phoneNumberTextField: UITextField!
    
    @IBOutlet private weak var saveButton: UIButton!
    
    private var person: Person?
    
    var index: Int?
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @IBAction private func firstNameTextFieldAction(_ sender: UITextField) {
        if let text = sender.text { person?.firstName = text }
        checkChanges()
    }
    
    @IBAction private func lastNameTextFieldAction(_ sender: UITextField) {
        if let text = sender.text { person?.lastName = text }
        checkChanges()
    }
    
    @IBAction private func emailTextFieldAction(_ sender: UITextField) {
        if let text = sender.text { person?.email = text }
        checkChanges()
    }
    
    @IBAction private func phoneNumberTextFieldAction(_ sender: UITextField) {
        if let text = sender.text,
           let phoneNumber = Int(text) {
            person?.phoneNumber = phoneNumber
        }
        checkChanges()
    }
    
    @IBAction private func saveButtonAction() {
        if let index, let person = person {
            DataManager.shared.persons[index] = person
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    private func checkChanges() {
        if let index {
            saveButton.isEnabled = person != DataManager.shared.persons[index]
        }
    }
    
    private func setupUI() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
        
        guard let index = self.index else { return }
        
        person = DataManager.shared.persons[index]
        
        firstNameTextField.text = person?.firstName
        lastNameTextField.text = person?.lastName
        emailTextField.text = person?.email
        if let phoneNumber = person?.phoneNumber {
            phoneNumberTextField.text = String(phoneNumber)
        }
        checkChanges()
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("return")
        return true
    }
    
}

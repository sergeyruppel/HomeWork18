//
//  ChangeDataViewController.swift
//  ContactList
//
//  Created by Sergey Ruppel on 25.09.2023.
//

import UIKit

class ChangeDataViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTX: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var person: Person?
    var editedPerson: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTF.delegate = self
        
        firstNameTF.text = person?.firstName
        lastNameTX.text = person?.lastName
        emailTF.text = person?.email
        if let phoneNumber = person?.phoneNumber {
            phoneTF.text = String(phoneNumber)
        }
        editedPerson = person
        checkChanges()
    
    }

    @IBAction func firstNameTFAction(_ sender: UITextField) {
        if let text = sender.text {
            person?.firstName = text
        }
        checkChanges()
    }
    
    @IBAction func lastNameTFAction() {
    }
    
    @IBAction func emailTFAction() {
    }
    
    @IBAction func phoneNumberTFAction() {
    }
    
    
    
    @IBAction func saveButtonAction() {
    }
    
    func checkChanges() {

        saveButton.isEnabled = person != editedPerson
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("return")
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

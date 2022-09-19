//
//  ViewController.swift
//  SuperSenha
//
//  Created by usuario on 19/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfChars: UITextField!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swSpecialChars: UISwitch!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewControler = segue.destination as! PasswordsViewController
        
        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            passwordsViewControler.numberOfPasswords = numberOfPasswords
        }
        
        if let numberOfCharacters = Int(tfNumberOfChars.text!) {
            passwordsViewControler.numberOfChars = numberOfCharacters
        }
        
        passwordsViewControler.useNumbers = swNumbers.isOn
        passwordsViewControler.useLetters = swLetters.isOn
        passwordsViewControler.useSpecialChars = swSpecialChars.isOn
        passwordsViewControler.useCapitalLetters = swCapitalLetters.isOn
        view.endEditing(true)
    }
}


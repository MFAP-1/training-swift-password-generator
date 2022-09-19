import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var textViewPasswords: UITextView!
    
    var numberOfPasswords: Int = 1
    var numberOfChars: Int = 10
    var useLetters: Bool!
    var useNumbers: Bool!
    var useSpecialChars: Bool!
    var useCapitalLetters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de senhas: \(numberOfPasswords)"
        passwordGenerator = PasswordGenerator(numberOfChars: numberOfChars, useLetters: useLetters, useNumbers: useNumbers, useSpecialChars: useSpecialChars, useCapitalLetters: useCapitalLetters)
        
        generatePasswords()
    }
    
    
    func generatePasswords() {
        textViewPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        textViewPasswords.text = ""
        
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            textViewPasswords.text.append(password + "\n\n")
        }
    }

    @IBAction func generateAgain(_ sender: Any) {
        generatePasswords()
    }
}

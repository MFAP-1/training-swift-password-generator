import Foundation

class PasswordGenerator {
    var numberOfChars: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useSpecialChars: Bool
    var useCapitalLetters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialChars = "!@#$%^&*)/*-+."
    private let numbers = "0123456789"
    
    init(numberOfChars: Int, useLetters: Bool, useNumbers: Bool, useSpecialChars: Bool, useCapitalLetters: Bool) {
        // validation
        var numChars = min(numberOfChars, 16)
        numChars = max(numChars, 6)
        
        self.numberOfChars = numChars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useSpecialChars = useSpecialChars
        self.useCapitalLetters = useCapitalLetters
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        if useNumbers {
            universe += numbers
        }
        if useSpecialChars {
            universe += specialChars
        }
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe)
        
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfChars {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        
        return passwords
    }
}

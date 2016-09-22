extension String {
    
    // 1.1
    var isUnique : Bool {
        get {
            return self.characters.count == Set(self.characters).count
        }
    }
    
    // 1.2
    func checkPermutation(otherString: String) -> Bool {
        
        
        return self.characters.sorted() == otherString.characters.sorted()
    }
    
    // 1.3
    var URLify: String {

        get {
            return self.characters.reduce("") {
                string, el in
                if el == " " {
                    return string + "%20"
                }
                return string + "\(el)"
            }
        }
    }
    
    // 1.4
    var isPalindromePermutation : Bool {
        get {
            let chars = self.characters.filter { $0 != " " }
            if chars.count == 1 {
                return true
            }
            
            var charCount : [Character:Int] = [:]
            
            for character in chars {
                if let cc = charCount[character] {
                    charCount[character] = cc + 1
                } else {
                    charCount[character] = 1
                }
            }
            
            var middleChar: Character?
            for (letter, letterCount) in charCount {
                if letterCount % 2 == 1 {
                    if middleChar == nil {
                        // grab one of this letter to be the middle one
                        middleChar = letter
                    } else {
                        // can't be palindrome
                        return false
                    }
                }
            }
            return true
        }
    }
}

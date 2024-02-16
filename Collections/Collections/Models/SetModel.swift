import Foundation

final class SetModel {
    
    func isLetters(text: String) -> Bool {
        let characterSet = CharacterSet(charactersIn: text)
        return characterSet.isSubset(of: .letters)
    }
    
    func matchingLetters(_ firstText: String, _ secondText: String) -> String {
        let firstTextSet = Set(firstText)
        let secondTextSet = Set(secondText)
        return String(firstTextSet.intersection(secondTextSet).sorted())
    }
    
    func notMatchCharacter(_ firstText: String, _ secondText: String) -> String {
        let firstTextSet = Set(firstText)
        let secondTextSet = Set(secondText)
        return String(firstTextSet.symmetricDifference(secondTextSet).sorted())
    }
    
    func uniqueCharactersFromFirstTF(_ firstText: String, _ secondText: String) -> String {
        let firstTextSet = Set(firstText)
        let secondTextSet = Set(secondText)
        return String(firstTextSet.subtracting(secondTextSet).sorted())
    }

    
}

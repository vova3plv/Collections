import Foundation

enum FindingType: String, CaseIterable {
    case findFirstElement = "Find the first contact"
    case findLastElement = "Find the last contact"
    case searchForNonExistingElement = "Search for a non-existing element"
}

struct DictionaryModel {
    
    var arrayOfNames = Array<String>()
    var arrayOfPhones = Array<String>()
    var dictionaryOfContacts = Dictionary<String, String>()
    
    mutating func createCollections() {
        for index in 0..<10_000_000 {
            arrayOfNames.append("Name\(index)")
            arrayOfPhones.append("099\(index)")
            dictionaryOfContacts["Name\(index)"] = "050\(index)"
        }
    }
    
    private func findFirstElementOfArray() -> String? {
        guard let index = arrayOfNames.firstIndex(of: "Name0") else { return nil }
        return arrayOfPhones[index]
    }
    
    private func findFirstElementOfDictionary() -> String? {
        dictionaryOfContacts["Name0"] ?? nil
    }
    
    private func findLastElementOfArray() -> String? {
        guard let index = arrayOfNames.firstIndex(of: "Name999999") else { return nil }
        return arrayOfPhones[index]
    }
    
    private func findLastElementOfDictionary() -> String? {
        dictionaryOfContacts["Name999999"] ?? nil
    }
    
    private func searchForNonExistingElementOfArray() -> String? {
        guard let index = arrayOfNames.firstIndex(of: "Unknown name") else { return nil}
        return arrayOfPhones[index]
    }
    
    private func searchForNonExistingElementOfDictionary() -> String? {
        dictionaryOfContacts["Unknown name"] ?? nil
    }
    
    func startOperation(for operation: FindingType, ofArray: Bool) -> String {
        switch (operation, ofArray) {
        case (.findFirstElement, true):
            return findFirstElementOfArray() ?? "does not exist"
        case (.findFirstElement, false):
            return findFirstElementOfDictionary() ?? "does not exist"
        case (.findLastElement, true):
            return findLastElementOfArray() ?? "does not exist"
        case (.findLastElement, false):
            return findLastElementOfDictionary() ?? "does not exist"
        case (.searchForNonExistingElement, true):
            return searchForNonExistingElementOfArray() ?? "does not exist"
        case (.searchForNonExistingElement, false):
            return searchForNonExistingElementOfDictionary() ?? "does not exist"
        }
    }
}

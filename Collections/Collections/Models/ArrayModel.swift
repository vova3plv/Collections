import Foundation

enum TypeOperation: String, CaseIterable {
    case insertAtTheBeginningOneByOne = "Insert 1000 elements at the beginning of the array one-by-one."
    case insertAtTheBeginningAtOnce = "Insert 1000 elements at the beginning of the array."
    case insertInTheMiddleOneByOne = "Insert 1000 elements in the middle of the array one-by-one."
    case insertInTheMiddleAtOnce = "Insert 1000 elements in the middle of the array."
    case appendAtTheEndOneByOne = "Insert 1000 elements at the end of the array one-by-one."
    case appendAtTheEndAtOnce = "Insert 1000 elements at the end of the array all."
    case removeAtTheBeginningOneByOnce = "Remove 1000 elements at the beginning of the array one-by-one."
    case removeAtTheBeginningAtOnce = "Remove 1000 elements at the beginning of the array."
    case removeInTheMiddleOneByOnce = "Remove 1000 elements in the middle of the array one-by-one."
    case removeInTheMiddleAtOnce = "Remove 1000 elements in the middle of the array."
    case removeAtTheEndOneByOnce = "Remove 1000 elements at the end of the array one-by-one."
    case removeAtTheEndAtOnce = "Remove 1000 elements at the end of the array."
}

final class ArrayModel {
    
    var mainArray = Array<Int>()
    private var auxiliaryArray = Array<Int>()
    
    var isEmpty: Bool {
        mainArray.isEmpty
    }
    
    deinit {
        print("Arrays were deleted")
    }
    
    func createArrays() {
        mainArray = Array(0..<10_000_000)
        createAuxiliaryArray()
    }
    
    private func createAuxiliaryArray() {
        auxiliaryArray = Array(0..<1000)
    }
    
    private func copyArray() -> [Int] {
        return mainArray
    }
    
    private func insertAtTheBeginningOneByOne() {
        var arrayForOperation = copyArray()
        for (index, number) in auxiliaryArray.enumerated() {
            arrayForOperation.insert(number, at: index)
        }
        print("First operation finished")
    }
    
    private func insertAtTheBeginningAtOnce() {
        var arrayForOperation = copyArray()
        arrayForOperation.insert(contentsOf: auxiliaryArray, at: 0)
        print("Second operation finished")
    }
    
    private func insertInTheMiddleOneByOne() {
        var arrayForOperation = copyArray()
        var index = mainArray.count / 2
        for number in auxiliaryArray {
            arrayForOperation.insert(number, at: index)
            index += 1
        }
        print("Third operation finished")
    }
    
    private func insertInTheMiddleAtOnce() {
        var arrayForOperation = copyArray()
        arrayForOperation.insert(contentsOf: auxiliaryArray, at: mainArray.count / 2)
    }
    
    private func appendAtTheEndOneByOne() {
        var arrayForOperation = copyArray()
        for number in auxiliaryArray {
            arrayForOperation.append(number)
        }
    }
    
    private func appendAtTheEndAtOnce() {
        var arrayForOperation = copyArray()
        arrayForOperation.append(contentsOf: auxiliaryArray)
    }
    
    private func removeAtTheBeginningOneByOnce() {
        var arrayForOperation = copyArray()
        for _ in 0..<1000 {
            arrayForOperation.removeFirst()
        }
    }
    
    private func removeAtTheBeginningAtOnce() {
        var arrayForOperation = copyArray()
        arrayForOperation.removeFirst(auxiliaryArray.count)
    }
    
    private func removeInTheMiddleOneByOne() {
        var arrayForOperation = copyArray()
        for _ in auxiliaryArray {
            arrayForOperation.remove(at: mainArray.count / 2)
        }
    }
    
    private func removeInTheMiddleAtOnce() {
        var arrayForOperation = copyArray()
        let leftIndex = mainArray.count / 2 - auxiliaryArray.count / 2
        let rightIndex = mainArray.count / 2 + auxiliaryArray.count / 2
        arrayForOperation.removeSubrange(leftIndex ..< rightIndex)
    }
    
    private func removeAtTheEndOneByOne() {
        var arrayForOperation = copyArray()
        for _ in auxiliaryArray {
            arrayForOperation.removeLast()
        }
    }
    
    private func removeAtTheEndAtOnce() {
        var arrayForOperation = copyArray()
        arrayForOperation.removeLast(auxiliaryArray.count)
    }
    
    func startOperation(for operation: TypeOperation) {
        switch operation {
            
        case .insertAtTheBeginningOneByOne:
            insertAtTheBeginningOneByOne()
            
        case .insertAtTheBeginningAtOnce:
            insertAtTheBeginningAtOnce()
            
        case .insertInTheMiddleOneByOne:
            insertInTheMiddleOneByOne()
            
        case .insertInTheMiddleAtOnce:
            insertInTheMiddleAtOnce()
            
        case .appendAtTheEndOneByOne:
            appendAtTheEndOneByOne()
            
        case .appendAtTheEndAtOnce:
            appendAtTheEndAtOnce()
            
        case .removeAtTheBeginningOneByOnce:
            removeAtTheBeginningOneByOnce()
            
        case .removeAtTheBeginningAtOnce:
            removeAtTheBeginningAtOnce()
            
        case .removeInTheMiddleOneByOnce:
            removeInTheMiddleOneByOne()
            
        case .removeInTheMiddleAtOnce:
            removeInTheMiddleAtOnce()
            
        case .removeAtTheEndOneByOnce:
            removeAtTheEndOneByOne()
            
        case .removeAtTheEndAtOnce:
            removeAtTheEndAtOnce()
        }
    }
}

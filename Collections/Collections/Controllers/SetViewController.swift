import UIKit

final class SetViewController: UIViewController {
    
    //MARK: Views
    private lazy var setView = SetView()
    
    //MARK: Model
    private let setModel = SetModel()
    
    var firstText: String {
        setView.firstTextField.text ?? ""
    }
    
    var secondText: String {
        setView.secondTextField.text ?? ""
    }
    
    //MARK: Lifecycle
    
    override func loadView() {
        self.view = setView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDelegates()
        addTargets()
    }
    
    //MARK: Setup UI
    private func setupUI() {
        self.navigationItem.title = "Set"
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    //MARK: Setup Delegate
    private func setupDelegates() {
        //text fields
        setView.firstTextField.delegate = self
        setView.secondTextField.delegate = self
    }
    
    //MARK: Action for button
    private func addTargets() {
        setView.matchingLettersButton.addTarget(self, action: #selector(matchingLettersButtonTapped), for: .touchUpInside)
        setView.notMatchCharactersButton.addTarget(self, action: #selector(notMatchCharactersButtonTapped), for: .touchUpInside)
        setView.uniqueCharactersFromFirstTFButton.addTarget(self, action: #selector(uniqueCharactersButtonTapped), for: .touchUpInside)
    }
    
    @objc func matchingLettersButtonTapped() {
        setView.matchingLettersLabel.text = setModel.matchingLetters(firstText, secondText)
    }
    
    @objc func notMatchCharactersButtonTapped() {
        setView.notMatchCharactersLabel.text = setModel.notMatchCharacter(firstText, secondText)
    }
    
    @objc func uniqueCharactersButtonTapped() {
        setView.uniqueCharactersFromFirstTFLabel.text = setModel.uniqueCharactersFromFirstTF(firstText, secondText)
    }
    
}

//MARK: Text Field Delegate
extension SetViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        setModel.isLetters(text: string)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }
}


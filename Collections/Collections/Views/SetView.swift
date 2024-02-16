import UIKit

class SetView: UIView {
    //MARK: Views
    lazy var firstTextField: UITextField = {
        let textField = UITextField()
        textField.attributedTextField()
        textField.accessibilityIdentifier = "FirstTFid"
        return textField
    }()
    
    lazy var secondTextField: UITextField = {
        let textField = UITextField()
        textField.attributedTextField()
        textField.accessibilityIdentifier = "SecondTFid"
        return textField
    }()
    
    lazy var matchingLettersButton: UIButton = {
        let button = UIButton()
        button.attributedButton(title: "All matching letters")
        return button
    }()
    
    lazy var matchingLettersLabel: UILabel = {
        let label = UILabel()
        label.attributedLabel()
        return label
    }()
    
    lazy var notMatchCharactersButton: UIButton = {
        let button = UIButton()
        button.attributedButton(title: "All characters that do not match")
        return button
    }()
    
    lazy var notMatchCharactersLabel: UILabel = {
        let label = UILabel()
        label.attributedLabel()
        return label
    }()
    
    lazy var uniqueCharactersFromFirstTFButton: UIButton = {
        let button = UIButton()
        button.attributedButton(title: "All unique characters from the first text field that do not match in text fields")
        return button
    }()
    
    lazy var uniqueCharactersFromFirstTFLabel: UILabel = {
        let label = UILabel()
        label.attributedLabel()
        return label
    }()
    
    //MARK: Init
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup UI
    private func setupViews() {
        backgroundColor = .white
        setupFirstTextField()
        setupSecondTextField()
        setupMatchingLettersButton()
        setupMatchingLettersLabel()
        setupNotMatchCharactersButton()
        setupNotMatchCharactersLabel()
        setupUniqueCharactersFromFirstTFButton()
        setupUniqueCharactersFromFirstTFLabel()
        
    }
    
    private func setupFirstTextField() {
        addSubview(firstTextField)
        NSLayoutConstraint.activate([
            firstTextField.heightAnchor.constraint(equalToConstant: 40),
            firstTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            firstTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            firstTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func setupSecondTextField() {
        addSubview(secondTextField)
        NSLayoutConstraint.activate([
            secondTextField.heightAnchor.constraint(equalToConstant: 40),
            secondTextField.topAnchor.constraint(equalTo: firstTextField.bottomAnchor, constant: 35),
            secondTextField.leadingAnchor.constraint(equalTo: firstTextField.leadingAnchor),
            secondTextField.trailingAnchor.constraint(equalTo: firstTextField.trailingAnchor)
        ])
    }
    
    private func setupMatchingLettersButton() {
        addSubview(matchingLettersButton)
        NSLayoutConstraint.activate([
           // matchingLettersButton.heightAnchor.constraint(equalToConstant: 40),
            matchingLettersButton.topAnchor.constraint(equalTo: secondTextField.bottomAnchor, constant: 35),
            matchingLettersButton.leadingAnchor.constraint(equalTo: firstTextField.leadingAnchor),
            matchingLettersButton.trailingAnchor.constraint(equalTo: firstTextField.trailingAnchor)
        ])
    }
    
    private func setupMatchingLettersLabel() {
        addSubview(matchingLettersLabel)
        NSLayoutConstraint.activate([
            matchingLettersLabel.topAnchor.constraint(equalTo: matchingLettersButton.bottomAnchor, constant: 15),
            matchingLettersLabel.leadingAnchor.constraint(equalTo: firstTextField.leadingAnchor),
            matchingLettersLabel.trailingAnchor.constraint(equalTo: firstTextField.trailingAnchor)
        ])
    }
    
    private func setupNotMatchCharactersButton() {
        addSubview(notMatchCharactersButton)
        NSLayoutConstraint.activate([
            notMatchCharactersButton.topAnchor.constraint(equalTo: matchingLettersLabel.bottomAnchor, constant: 15),
            notMatchCharactersButton.leadingAnchor.constraint(equalTo: firstTextField.leadingAnchor),
            notMatchCharactersButton.trailingAnchor.constraint(equalTo: firstTextField.trailingAnchor)
        ])
    }
    
    private func setupNotMatchCharactersLabel() {
        addSubview(notMatchCharactersLabel)
        NSLayoutConstraint.activate([
            notMatchCharactersLabel.topAnchor.constraint(equalTo: notMatchCharactersButton.bottomAnchor, constant: 15),
            notMatchCharactersLabel.leadingAnchor.constraint(equalTo: firstTextField.leadingAnchor),
            notMatchCharactersLabel.trailingAnchor.constraint(equalTo: firstTextField.trailingAnchor)
        ])
    }
    
    private func setupUniqueCharactersFromFirstTFButton() {
        addSubview(uniqueCharactersFromFirstTFButton)
        NSLayoutConstraint.activate([
            uniqueCharactersFromFirstTFButton.topAnchor.constraint(equalTo: notMatchCharactersLabel.bottomAnchor, constant: 25),
            uniqueCharactersFromFirstTFButton.leadingAnchor.constraint(equalTo: firstTextField.leadingAnchor),
            uniqueCharactersFromFirstTFButton.trailingAnchor.constraint(equalTo: firstTextField.trailingAnchor)
        ])
    }
    
    private func setupUniqueCharactersFromFirstTFLabel() {
        addSubview(uniqueCharactersFromFirstTFLabel)
        NSLayoutConstraint.activate([
            //так можна анврапать?
            uniqueCharactersFromFirstTFLabel.topAnchor.constraint(equalTo: uniqueCharactersFromFirstTFButton.bottomAnchor, constant: 20),
            uniqueCharactersFromFirstTFLabel.leadingAnchor.constraint(equalTo: firstTextField.leadingAnchor),
            uniqueCharactersFromFirstTFLabel.trailingAnchor.constraint(equalTo: firstTextField.trailingAnchor)
        ])
    }
}

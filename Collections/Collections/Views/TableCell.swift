import UIKit

final class TableCell: UITableViewCell {
    //MARK: Views
    private lazy var nameCellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupNameCellLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNameCellLabel()
    }
    
    //MARK: SetupUI
    func setupNameCellLabel() {
        contentView.addSubview(nameCellLabel)
        NSLayoutConstraint.activate([
            nameCellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            nameCellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            nameCellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            nameCellLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func bind(to name: String) {
        nameCellLabel.text = name
    }
}

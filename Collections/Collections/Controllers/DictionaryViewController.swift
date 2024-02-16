import UIKit

final class DictionaryViewController: UIViewController {

    //MARK: Views
    private lazy var dictionaryView = DictionaryView()
    
    //MARK: Model
    private var dictionaryModel = DictionaryModel()
    
    //MARK: Lifecycle
    private let queue = DispatchQueue.global(qos: .utility)
    
    override func loadView() {
        self.view = dictionaryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupHelpers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpCollectionView(loading: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpCollectionView(loading: false)
    }
    
    //MARK: Setup UI
    private func setupUI() {
        self.navigationItem.title = "Dictionary"
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    //MARK: Setup Delegate
    private func setupHelpers() {
        dictionaryView.dictionaryCollectionView.delegate = self
        dictionaryView.dictionaryCollectionView.dataSource = self
    }
    
    //MARK: Methods
    private func setUpCollectionView(loading: Bool) {
        if loading {
            dictionaryView.startIndicator()
        } else {
            dictionaryModel.createCollections()
            dictionaryView.stopIndicator()
        }
    }
    
    func measureOperationTime(operation: () -> String) -> (String, String) {
        let startTime = Double(DispatchTime.now().rawValue)
        let phoneNumber = operation()
        let stopTime = Double(DispatchTime.now().rawValue)
        let runtime = (stopTime - startTime) / 1_000_000
        return (String(format: "%.3f", runtime), phoneNumber)
    }
}

extension DictionaryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FindingType.allCases.count * 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollectionCell = collectionView.dequeueReusableCell(for: indexPath)
        let findingType = FindingType.allCases[indexPath.item/2]
        cell.bind(to: findingType.rawValue)
        return cell
    }
    
    
}

extension DictionaryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionCell
        cell.startIndicator()
        queue.async {
            let (runtime, phoneNumber) = self.measureOperationTime {
                self.dictionaryModel.startOperation(for: FindingType.allCases[indexPath.item/2], ofArray: indexPath.item % 2 == 0)
            }
            DispatchQueue.main.async {
                cell.stopIndicator()
                let typeOperation = FindingType.allCases[indexPath.item/2]
                cell.bind(to: typeOperation, runtime: runtime, for: phoneNumber)
            }
        }
    }
    
}

extension DictionaryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width/2) - 1
        let height = (collectionView.frame.height/8.15)
        return CGSize(width: width, height: height)
    }
    
}

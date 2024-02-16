import UIKit

final class ArrayViewController: UIViewController {

    //MARK: Views
    private lazy var arrayView = ArrayView()
    private lazy var arrayCollectionHeader = ArrayCollectionHeader()
    private lazy var arrayCollectionCell = CollectionCell()
    
    //MARK: Model
    private var arrayModel = ArrayModel()
    
    //MARK: Lifecycle
    private let queue = DispatchQueue.global(qos: .utility)
    
    override func loadView() {
        self.view = arrayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupHelpers()
    }
    
    //MARK: Setup UI
    private func setupUI() {
        self.navigationItem.title = "Arrays"
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    //MARK: Setup Delegate & DataSource
    
    private func setupHelpers() {
        arrayView.arrayCollectionView.delegate = self
        arrayView.arrayCollectionView.dataSource = self
    }
    
    //MARK: Methods
    //метод для отработки нажатия по хедеру
    func performCreateArray(completion: @escaping (String?) -> Void) {
        let indexPaths = arrayView.arrayCollectionView.indexPathsForVisibleSupplementaryElements(ofKind: UICollectionView.elementKindSectionHeader)
        guard let indexPathFirst = indexPaths.first else { return }
        let header = arrayView.arrayCollectionView.supplementaryView(forElementKind: UICollectionView.elementKindSectionHeader, at: indexPathFirst) as! ArrayCollectionHeader
        
        header.startIndicator()
        
        queue.async {
            let runtime = self.measureOperationTime {
                self.arrayModel.createArrays()
            }
            DispatchQueue.main.async {
                header.stopIndicator()
                self.arrayView.arrayCollectionView.reloadData()
                completion(runtime)
            }
        }
    }
    
    func measureOperationTime(operation: () -> Void) -> String {
        let startTime = Double(DispatchTime.now().rawValue)
        operation()
        let stopTime = Double(DispatchTime.now().rawValue)
        let runtime = (stopTime - startTime) / 1_000_000
        return String(format: "%.3f", runtime)
    }
}

//MARK: Data Source
extension ArrayViewController: UICollectionViewDataSource, HeaderViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if arrayModel.isEmpty {
            return 0
        } else {
            return TypeOperation.allCases.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollectionCell = collectionView.dequeueReusableCell(for: indexPath)
        let typeOperation = TypeOperation.allCases[indexPath.item]
        cell.bind(to: typeOperation.rawValue)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header: ArrayCollectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, for: indexPath)
            header.delegate = self
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}

//MARK: Delegate
extension ArrayViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionCell
        cell.startIndicator()
        queue.async {
            let runtime = self.measureOperationTime {
                self.arrayModel.startOperation(for: TypeOperation.allCases[indexPath.item])
            }
            DispatchQueue.main.async {
                cell.stopIndicator()
                
                let typeOperation = TypeOperation.allCases[indexPath.item]
                cell.bind(to: typeOperation, runtime: runtime)
            }
        }
        
    }
}

//MARK: Flow layout
extension ArrayViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width/2) - 1
        let height = (collectionView.frame.height/8.15)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0)
    }
    
    //for header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = (collectionView.frame.width)
        let height = (collectionView.frame.height/7)
        return CGSize(width: width, height: height)
    }
}

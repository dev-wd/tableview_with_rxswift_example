import UIKit
import RxSwift
import RxCocoa

class FruitEX1ViewController: UIViewController, UITableViewDelegate{
    @IBOutlet weak var tableRef: UITableView!
    
    var fruitDic: BehaviorRelay<[[String : String]]> =
        BehaviorRelay(value:
            [["name":"apple"],
             ["name":"banana"],
             ["name":"cherries"],
             ["name":"grapes"],
             ["name":"lemon"],
             ["name":"orange"],
             ["name":"strawberry"],
             ["name":"tomato"]])
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTableView()
    }
    
    
    func inputTableView() {
        
        // Set tableview delegate. (for setting table view cell height)
        tableRef.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        // Bind fruit dictionary and tableview
        fruitDic.asObservable()
            .bind(to: tableRef.rx
                .items(cellIdentifier: "Cell", cellType: FruitEX1Cell.self))
            { index, element, cell in
                
                // Write image, name for cell label.
                cell.fruitImage.image = UIImage(named: element["name"]!)
                cell.fruitNameLabel.text = element["name"]
        }.disposed(by: disposeBag)
        
        tableRef.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

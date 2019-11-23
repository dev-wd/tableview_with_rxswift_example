import UIKit
import RxSwift
import RxCocoa

class FruitEX1ViewController: UIViewController, UITableViewDelegate{
    @IBOutlet weak var tableRef: UITableView!
    
    var fruitDic: BehaviorRelay<[[String : String]]> = BehaviorRelay(value:[["name":"apple"],["name":"banana"], ["name":"cherries"],["name":"grapes"],["name":"lemon"],["name":"orange"],["name":"strawberry"],["name":"tomato"]])
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InputTableView()
    }

    
    func InputTableView() {
        tableRef.rx.setDelegate(self).disposed(by: disposeBag)
        
        fruitDic.asObservable().bind(to: tableRef.rx.items(cellIdentifier: "Cell", cellType: FruitEX1Cell.self))
        {index, element, cell in
            cell.fruitImage.image = UIImage(named: element["name"]!)
            cell.fruitNameLabel.text = element["name"]
        }.disposed(by: disposeBag)
        
        tableRef.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

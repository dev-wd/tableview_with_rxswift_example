import UIKit
import RxSwift
import RxCocoa

class FruitEX3ViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var tableRef: UITableView!
    
    var fruitDic: BehaviorRelay<[[String : String]]> = BehaviorRelay(value:[["name":"apple"],["name":"banana"], ["name":"cherries"],["name":"grapes"],["name":"lemon"],["name":"orange"],["name":"strawberry"],["name":"tomato"]])
    
    var disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InputTableView()
        }
    
    func InputTableView() {
        
        // Set tableview delegate. (for setting table view cell height)
        tableRef.rx.setDelegate(self).disposed(by: disposeBag)
        
        // Bind fruit dictionary and tableview.
        fruitDic.asObservable().bind(to: tableRef.rx.items(cellIdentifier: "Cell", cellType: FruitEX3Cell.self))
        {index, element, cell in
            
            // Write image, name for cell label.
            cell.fruitImage.image = UIImage(named: element["name"]!)
            cell.fruitNameLabel.text = element["name"]
           
            // Remove cell by cancel button.
            cell.cancelButton.rx.tap
             .subscribe(onNext: { [weak self] in
             let curIndex = index
                 var tempDic = self!.fruitDic.value
            tempDic.remove(at: curIndex)
                 self!.fruitDic.accept(tempDic)
                 print("ViewModel.QRDid: ",self!.fruitDic.value)
             }).disposed(by: cell.bag)
            
        }.disposed(by: disposeBag)
        
        tableRef.tableFooterView = UIView()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
    


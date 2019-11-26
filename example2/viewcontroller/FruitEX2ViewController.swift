import UIKit
import RxSwift
import RxCocoa

class FruitEX2ViewController: UIViewController , UITableViewDelegate{
    @IBOutlet weak var tableRef: UITableView!
    @IBOutlet weak var nextPageButton: UIButton!
    
    
    var firstFruitDic: BehaviorRelay<[[String : String]]> = BehaviorRelay(value:[["number":"1.","name":""],["number":"2.","name":""],["number":"3.","name":""],["number":"4.","name":""],["number":"5.","name":""],["number":"6.","name":""],["number":"7.","name":""],["number":"8.","name":""]])
    
    var updatedFruitDic: BehaviorRelay<[[String : String]]> = BehaviorRelay(value:[["number":"1.","name":""],["number":"2.","name":""],["number":"3.","name":""],["number":"4.","name":""],["number":"5.","name":""],["number":"6.","name":""],["number":"7.","name":""],["number":"8.","name":""]])
    
       var disposeBag = DisposeBag()
    var temDic : [[String: String]] = []
    
       override func viewDidLoad() {
           super.viewDidLoad()
        
         InputTableView()
        ButtonTapped()
       }
    
    func ButtonTapped() {
        
        // Press nextpage button.
        nextPageButton.rx.tap.asDriver().drive(onNext: {
            self.performSegue(withIdentifier: "showNextPage", sender: self)
            print("buttontapp fruid dic : ",self.firstFruitDic.value)
            
           
            }).disposed(by: disposeBag)
    }
    
    func InputTableView() {
        
        temDic = self.firstFruitDic.value
        // Set tableview delegate. (for setting table view cell height)
        tableRef.rx.setDelegate(self).disposed(by: disposeBag)
        
        // Bind fruit dictionary and tableview.
        firstFruitDic.asObservable().bind(to: tableRef.rx.items(cellIdentifier: "Cell", cellType: FruitEX2Cell.self))
        {index, element, cell in
            
        // Write number for cell textfield.
        cell.fruitNumber.text = element["number"]
            
        // Update Dictionary from cell textfield.
        cell.fruitTextField.rx.text.orEmpty.asDriver().drive(onNext: { cellvalue in
            self.temDic[index]["name"] = cellvalue
            self.updatedFruitDic.accept(self.temDic)

            }).disposed(by: cell.bag)
           
        }.disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    // For showing result, pass parameter to next page.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let param = segue.destination as! FruitEX2NextPageViewController
            param.showDic = updatedFruitDic
    }
}

import UIKit
import RxSwift
import RxCocoa


class FruitEX2NextPageViewController: UIViewController {
    
    @IBOutlet weak var fruit1Image: UIImageView!
    @IBOutlet weak var fruit2Image: UIImageView!
    @IBOutlet weak var fruit3Image: UIImageView!
    @IBOutlet weak var fruit4Image: UIImageView!
    @IBOutlet weak var fruit5Image: UIImageView!
    @IBOutlet weak var fruit6Image: UIImageView!
    @IBOutlet weak var fruit7Image: UIImageView!
    @IBOutlet weak var fruit8Image: UIImageView!
    
    var showDic : BehaviorRelay<[[String : String]]>!
    //let previousPage = FruitEX2ViewController()
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show Fruit images from previous page.
        showDic.bind(onNext: { element in
        self.fruit1Image.image = UIImage(named: element[0]["name"]!)
        self.fruit2Image.image = UIImage(named: element[1]["name"]!)
        self.fruit3Image.image = UIImage(named: element[2]["name"]!)
        self.fruit4Image.image = UIImage(named: element[3]["name"]!)
        self.fruit5Image.image = UIImage(named: element[4]["name"]!)
        self.fruit6Image.image = UIImage(named: element[5]["name"]!)
        self.fruit7Image.image = UIImage(named: element[6]["name"]!)
        self.fruit8Image.image = UIImage(named: element[7]["name"]!)
        }).disposed(by: disposeBag)
        
    }
}

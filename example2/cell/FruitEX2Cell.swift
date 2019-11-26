import UIKit
import RxSwift
import RxCocoa


class FruitEX2Cell: UITableViewCell {

    @IBOutlet weak var fruitNumber: UILabel!
    @IBOutlet weak var fruitTextField: UITextField!
    var bag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // Make disposbag empty for reusing cell.
    override func prepareForReuse() {
        super.prepareForReuse()
        bag = DisposeBag()
    }
}

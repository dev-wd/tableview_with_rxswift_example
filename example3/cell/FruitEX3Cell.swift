import UIKit
import RxSwift
import RxCocoa

class FruitEX3Cell: UITableViewCell {

    @IBOutlet weak var fruitNameLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var fruitImage: UIImageView!
    
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

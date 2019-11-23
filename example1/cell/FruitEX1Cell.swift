import UIKit
import RxCocoa
import RxSwift
class FruitEX1Cell: UITableViewCell {

    @IBOutlet weak var fruitImage: UIImageView!
    @IBOutlet weak var fruitNameLabel: UILabel!
    
    var bag = DisposeBag()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

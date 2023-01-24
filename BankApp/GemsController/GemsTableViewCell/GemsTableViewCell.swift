import UIKit

class GemsTableViewCell: UITableViewCell {

    @IBOutlet weak var townLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var edge: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var attestatLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setName(town: String, name: String,edge: String, weightLabel: String,colorLabel: String, costLabel: String, attestatLabel: String) {
        self.townLabel.text = town
        self.nameLabel.text = name
        self.edge.text = edge
        self.weightLabel.text = weightLabel
        self.colorLabel.text = colorLabel
        self.colorLabel.text = costLabel
        self.attestatLabel.text = attestatLabel

    }

    
}

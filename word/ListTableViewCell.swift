//
//  UITableViewCell.swift
//  word
//
//  Created by 八森聖人 on 2022/05/12.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var japaneseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

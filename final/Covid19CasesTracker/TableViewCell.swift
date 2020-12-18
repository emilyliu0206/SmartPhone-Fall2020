//
//  TableViewCell.swift
//  Covid19CasesTracker
//
//  Created by Jiaxin Liu on 12/16/20.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblConfirmedCases: UILabel!
    
    @IBOutlet weak var lblDeaths: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

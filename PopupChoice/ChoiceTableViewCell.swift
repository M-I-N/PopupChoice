//
//  ChoiceTableViewCell.swift
//  PopupChoice
//
//  Created by Nayem on 2/15/19.
//  Copyright © 2019 Mufakkharul Islam Nayem. All rights reserved.
//

import UIKit

class ChoiceTableViewCell: UITableViewCell {

    @IBOutlet weak var choiceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal static func dequeue(fromTableView pagerView: UITableView, atIndex index: IndexPath) -> ChoiceTableViewCell {
        guard let cell: ChoiceTableViewCell = pagerView.dequeueReusableCell(indexPath: index) else {
            fatalError("*** Failed to dequeue CollectionViewCell ***")
        }
        return cell
    }
    
}

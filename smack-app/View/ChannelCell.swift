//
//  ChannelCell.swift
//  smack-app
//
//  Created by Dan Sims on 4/17/18.
//  Copyright © 2018 Dan Sims. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var channelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel: Channel) {
        let title = channel.channelTitle ?? ""
        channelName.text = "#\(title)"
    }

}

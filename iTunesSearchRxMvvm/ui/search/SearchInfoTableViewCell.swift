//
//  SearchInfoTableViewCell.swift
//  iTunesSearchRxMvvm
//
//  Created by SeokJun Jeong on 2021/04/24.
//

import UIKit

class SearchInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(_ item: SearchInfoResponse) {
        trackImage.loadUrl(url: item.artworkUrl100)
        artistLabel.text = item.artistName
        trackLabel.text = item.trackName
    }
    
}

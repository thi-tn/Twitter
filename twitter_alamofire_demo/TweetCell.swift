//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by user144652 on 10/7/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    

    @IBOutlet weak var profilePicView: UIImageView!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    
    var tweet: Tweet! {
        didSet {
            self.profilePicView.af_setImage(withURL: (tweet.user?.profilePictureUrl)!)
            self.screenNameLabel.text = "@" + (tweet.user?.screenName)!
            self.tweetTextLabel.text = tweet.text
            self.usernameLabel.text = tweet.user?.name
            self.timeLabel.text = tweet.createdAtString
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

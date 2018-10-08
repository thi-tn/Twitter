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
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    
    @IBAction func didTapRetweet(_ sender: Any) {
        if tweet.retweeted == true {
            tweet.retweeted = false
            tweet.retweetCount = tweet.retweetCount! - 1
            (sender as AnyObject).setImage(UIImage(named: "retweet-icon"), for: UIControlState.normal)
            retweetCountLabel.text = String(tweet.retweetCount as! Int)
            APIManager.shared.unRetweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        } else {
            tweet.retweeted = true
            tweet.retweetCount = tweet.retweetCount! + 1
            (sender as AnyObject).setImage(UIImage(named: "retweet-icon-green"), for: UIControlState.normal)
            retweetCountLabel.text = String(tweet.retweetCount as! Int)
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
    }
    @IBAction func didTapFavorite(_ sender: Any) {
        if  tweet.favorited == true {
            tweet.favorited = false
            tweet.favoriteCount = tweet.favoriteCount! - 1
            (sender as AnyObject).setImage(UIImage(named: "favor-icon"), for: UIControlState.normal)
            APIManager.shared.unFavorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        } else {
            tweet.favorited = true
            tweet.favoriteCount = tweet.favoriteCount! + 1
            (sender as AnyObject).setImage(UIImage(named: "favor-icon-red"), for: UIControlState.normal)
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
        favoriteCountLabel.text = String(tweet.favoriteCount as! Int)
        
    }
    
    var tweet: Tweet! {
        didSet {
            self.profilePicView.af_setImage(withURL: (tweet.user?.profilePictureUrl)!)
            self.screenNameLabel.text = "@" + (tweet.user?.screenName)!
            self.tweetTextLabel.text = tweet.text
            self.usernameLabel.text = tweet.user?.name
            self.timeLabel.text = tweet.createdAtString
        }
    }
    
//    func refreshData() {
//        retweetButton.setImage(UIImage(named: "favor-icon-red"), for: isSelected)
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

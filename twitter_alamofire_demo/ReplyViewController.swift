//
//  ReplyViewController.swift
//  twitter_alamofire_demo
//
//  Created by student on 10/14/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ReplyViewController: UIViewController {

    @IBOutlet var profilePicView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var screenNameLabel: UILabel!
    @IBOutlet var tweetTextLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var retweetCountLabel: UILabel!
    @IBOutlet var favoriteCountLabel: UILabel!
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePicView.af_setImage(withURL: (tweet.user?.profilePictureUrl)!)
        screenNameLabel.text = "@" + (tweet.user?.screenName)!
        tweetTextLabel.text = tweet.text
        usernameLabel.text = tweet.user?.name
        timeLabel.text = tweet.createdAtString
        retweetCountLabel.text = String(tweet.retweetCount as! Int)
        favoriteCountLabel.text = String(tweet.favoriteCount as! Int)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

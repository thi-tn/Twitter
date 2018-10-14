//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by student on 10/13/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class ProfileViewController: UIViewController {

    @IBOutlet var banner: UIImageView!
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var username: UILabel!
    @IBOutlet var screename: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var tweetCount: UILabel!
    @IBOutlet var followingCount: UILabel!
    @IBOutlet var followerCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        banner.af_setImage(withURL: (User.current?.profileBannerUrl)!)
        profilePic.af_setImage(withURL: (User.current?.profilePictureUrl)!)
        username.text = User.current?.name
        screename.text = User.current?.screenName
        descriptionLabel.text = User.current?.description
        tweetCount.text = String(User.current?.tweetCount as! Int)
        followingCount.text = String(User.current?.followingCount as! Int)
        followerCount.text = String(User.current?.followerCount as! Int)
        
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

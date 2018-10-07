//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by user144652 on 10/6/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class User {
    // MARK: Properties
    var name: String?
    var screenName: String?
    var profilePictureUrl: URL
    
    // Add any additional properties here
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        // Initialize any other properties
        //let baseURL = "https://image.tmdb.org/t/p/w500"
        //let profilePicturePath = dictionary["profile_image_url_https"] as! String
        profilePictureUrl = URL(string: dictionary["profile_image_url_https"] as! String)!
    }
    static var current: User?
}

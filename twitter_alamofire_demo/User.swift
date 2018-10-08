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
    var dictionary: [String: Any]?
    private static var _current: User?
    
    // Add any additional properties here
    init(dictionary: [String: Any]) {
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        // Initialize any other properties
        //let baseURL = "https://image.tmdb.org/t/p/w500"
        //let profilePicturePath = dictionary["profile_image_url_https"] as! String
        profilePictureUrl = URL(string: dictionary["profile_image_url_https"] as! String)!
    }
    
    static var current: User? {
        get {
            if _current == nil {
                let defaults = UserDefaults.standard
                if let userData = defaults.data(forKey: "currentUserData") {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! [String: Any]
                    _current = User(dictionary: dictionary)
                }
            }
            return _current
        }
        set (user) {
            _current = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
        }
    }
}

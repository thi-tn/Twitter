//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by user144652 on 10/13/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage


class ComposeViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var profilePicImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var screenNameLabel: UILabel!
    @IBOutlet var textView: UITextView!
    @IBOutlet var charCountLabel: UILabel!
    
  
    weak var delegate: ComposeViewControllerDelegate?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        APIManager.shared.composeTweet(with: textView.text!) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePicImageView.af_setImage(withURL: (User.current?.profilePictureUrl)!)
        userNameLabel.text = User.current?.name
        screenNameLabel.text = "@" + (User.current?.screenName)!
        textView.delegate = self
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            // Set the max character limit
            let characterLimit = 140
            
            // Construct what the new text would be if we allowed the user's latest edit
            let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
            
            // TODO: Update Character Count Label
            charCountLabel.text = "Character count: " + String(140 - newText.characters.count)
            // The new text should be allowed? True/False
            return newText.characters.count < characterLimit
    }
  
    
    /*
    // MARK: - Navigation
     

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}

protocol ComposeViewControllerDelegate: NSObjectProtocol {
    func did(post: Tweet)
}



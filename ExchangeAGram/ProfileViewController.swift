//
//  ProfileViewController.swift
//  ExchangeAGram
//
//  Created by Beetu on 8/25/15.
//  Copyright (c) 2015 Brijrajsinh Gohil. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, FBLoginViewDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fbLoginView: FBLoginView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.fbLoginView.delegate = self
        self.fbLoginView.permissions = ["public_profile", "publish_actions"]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginViewShowLoggedInUser(loginView: FBLoginView!) {
        profileImageView.hidden = false
        nameLabel.hidden = false
    }
    
    func loginFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        println(user)
        nameLabel.text = user.name
        let userImageURL = "http://graph.facebook.com/\(user.objectID)/picture?type=small"
        let url = NSURL(string: userImageURL)
        let imageData = NSData(contentsOfURL: url!)
        let image = UIImage(data: imageData!)
        profileImageView.image = image
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
        profileImageView.hidden = true
        nameLabel.hidden = true
    }
    
    func loginView(loginView: FBLoginView!, handleError error: NSError!) {
        println("Error: \(error.localizedDescription)")
    }

}

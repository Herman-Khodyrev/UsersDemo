//
//  ViewController.swift
//  Users
//
//  Created by Герман on 13.09.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageOfUser: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelCompany: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelRepositiries: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelDateOfCreation: UILabel!
    @IBOutlet weak var labelFollowers: UILabel!
    @IBOutlet weak var labelFollowing: UILabel!
    
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = user{
            
            imageOfUser.layer.masksToBounds = true
            imageOfUser.layer.cornerRadius = 100
            
            if let name = user.name{
                labelName.text = name
            }
            if user.email == "" || user.email == nil{
                labelEmail.text = "Email отсутсвует"
            }
            
            if let email = user.email{
                labelEmail.text = email
            }
            if let company = user.company{
                labelCompany.text = company
            }
            if let imageUrl = user.avatar_url{
                imageOfUser.image = user.getImage(stringUrl: imageUrl)
            }
            if let followers = user.followers{
                labelFollowers.lineBreakMode = .byWordWrapping
                labelFollowers.text = "Подписчиков \(followers)"
            }
            if let following = user.following{
                labelFollowing.lineBreakMode = .byWordWrapping
                labelFollowing.text = "Подписки \(following)"
            }
            if let repository = user.repos_url{
                labelRepositiries.text = "\(repository)"
            }
            if let location = user.location{
                labelLocation.text = "\(location)"
            }
            if let dateOfCreation = user.created_at{
                labelDateOfCreation.text = "\(dateOfCreation)"
            }
            
            
        }
        
    }



}


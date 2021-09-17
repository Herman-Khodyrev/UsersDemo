//
//  AllUsersTableViewController.swift
//  Users
//
//  Created by Герман on 13.09.21.
//

import UIKit

class AllUsersTableViewController: UITableViewController {
    
    var usersLogin : [Users] = []
    var usersProfile : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.hasActiveDrop
        
        
        if let url = URL(string: "https://api.github.com/users"),
           let data = try? Data(contentsOf: url),
           let uss = try? JSONDecoder().decode([Users].self, from: data){
            usersLogin = uss
        }
        
        for i in usersLogin.indices{

            if let urlUser = URL(string: usersLogin[i].url!),
               let data = try? Data(contentsOf: urlUser),
               let us = try? JSONDecoder().decode(User.self, from: data){
                usersProfile.append(us)
            }

        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return usersLogin.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellUsers", for: indexPath) as! AllUsersTableViewCell
        
        let itemUserProfile = usersProfile[indexPath.row]
        
        cell.imageUser.layer.masksToBounds = true
        cell.imageUser.layer.cornerRadius = 64
        
        if let nameForLabel = itemUserProfile.name{
            cell.labelUserName.text = nameForLabel
        }
        if itemUserProfile.email == nil{
            cell.labelUserEmail.text = "Email отсутствует"
        }
        if let emailForLabel = itemUserProfile.email {
            cell.labelUserEmail.text = emailForLabel
        }
        if let followersForLabel = itemUserProfile.followers{
            cell.labelUserFollowers.text = "Подписчиков  \(followersForLabel)"
        }
        if let followingForLabel = itemUserProfile.following{
            cell.labelUserFollowing.text = "Подписки   \(followingForLabel)"
        }
        if let dateOfCreating = itemUserProfile.created_at{
            cell.labelUserDateOfCreate.text = "\(dateOfCreating)"
        }
            
        if itemUserProfile.avatar_url == nil || itemUserProfile.avatar_url == ""{
            cell.imageUser.image = UIImage(named: "icon")
        }
        if let imageUrl = itemUserProfile.avatar_url{
            cell.imageUser.image = itemUserProfile.getImage(stringUrl: imageUrl)
        }
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let vc = segue.destination as! ViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
        
            vc.user = usersProfile[indexPath.row]
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    

}

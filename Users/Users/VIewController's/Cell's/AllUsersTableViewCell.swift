//
//  AllUsersTableViewCell.swift
//  Users
//
//  Created by Герман on 13.09.21.
//

import UIKit

class AllUsersTableViewCell: UITableViewCell {

    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelUserEmail: UILabel!
    @IBOutlet weak var labelUserDateOfCreate: UILabel!
    @IBOutlet weak var labelUserFollowers: UILabel!
    @IBOutlet weak var labelUserFollowing: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

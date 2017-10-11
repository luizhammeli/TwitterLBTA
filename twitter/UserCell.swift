//
//  Cell.swift
//  twitter
//
//  Created by Dev iOS on 10/10/17.
//  Copyright © 2017 Dev iOS. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell{
    
    override var datasourceItem: Any?{
        didSet{
            guard let user = datasourceItem as? User else {return}
            
            nameLabel.text = user.name
            username.text = user.username
            bioTextView.text = user.bioText
            profileImageView.image = user.profileImage
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BRIAN VOONG"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let username: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "@buildthatapp"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        return label
    }()
    
    let profileImageView: UIImageView = {
    
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5
        
        return imageView
    }()
    
    let bioTextView: UITextView = {
    
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.isEditable = false
        tv.text = "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!"
        tv.font = UIFont.systemFont(ofSize: 15)
        tv.contentInset = UIEdgeInsets(top: -8, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    let followButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(UIColor(r: 61, g: 167, b: 244), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(r: 61, g: 167, b: 244).cgColor
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setImage(UIImage(named:  "follow"), for:.normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(white: 0, alpha: 0.2)
        self.backgroundColor = .white
        self.addSubview(nameLabel)
        self.addSubview(profileImageView)
        self.addSubview(username)
        self.addSubview(bioTextView)
        self.addSubview(followButton)
        
        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 5, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        username.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: -1, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(username.bottomAnchor, left: username.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(nameLabel.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
}

//
//  HomeController.swift
//  twitter
//
//  Created by Dev iOS on 06/10/17.
//  Copyright © 2017 Dev iOS. All rights reserved.
//

import UIKit

struct Post{

    let image: String
    let text: String
    let name: String
    let nickName: String
    
    init(dictionary: [String: Any]) {
        image = dictionary["image"] as! String
        text = dictionary["text"] as! String
        name = dictionary["name"] as! String
        nickName = dictionary["nickName"] as! String
    }
}

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let headerCellId = "headerCellId"
    let footerCellId = "footerCellId"
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIColor(red: 231/255, green: 236/255, blue: 241/255, alpha: 1)
        self.collectionView?.register(WordCell.self, forCellWithReuseIdentifier: cellId)
        self.collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerCellId)
        self.collectionView?.register(FooterCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerCellId)
        
        let imageView = UIImageView(image: UIImage(named: "logo"), highlightedImage: nil)
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        self.navigationItem.titleView = imageView
        self.navigationController?.navigationBar.backgroundColor = .white
        
        getTestData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! WordCell
        cell.post = posts[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 125)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
            return CGSize(width: self.view.frame.width, height: 50)
    }    
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if(kind == UICollectionElementKindSectionHeader){
            let cell = self.collectionView?.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellId,   for: indexPath) as! HeaderCell
            return cell
        }else{
            let cell = self.collectionView?.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerCellId, for: indexPath) as! FooterCell
            return cell
        }
    }
    
    func getTestData(){
        
        let values = ["image": "starwars", "text": "Should you learn both iOS and Android at the same time? I don't exactly recommend doing both straight out of college. Some behind the scenes of shooting YouTube videos.", "name": "Brian Voong" , "nickName": "@buildthatapp"]
        
        let values2 = ["image": "war", "text": "Should you learn both iOS and Android at the same time? I don't exactly recommend doing both straight out of college. Some behind the scenes of shooting YouTube videos.", "name": "Donald Trump" , "nickName": "@trump"]
        
        let values3 = ["image": "spot", "text": "Should you learn both iOS and Android at the same time? I don't exactly recommend doing both straight out of college. Some behind the scenes of shooting YouTube videos.", "name": "Bill Gates" , "nickName": "@billgates"]
        
        let post1 = Post(dictionary: values)
        let post2 = Post(dictionary: values2)
        let post3 = Post(dictionary: values3)
        
        posts.append(post1)
        posts.append(post2)
        posts.append(post3)
    }
}

class WordCell: UICollectionViewCell{
    
    var post: Post?{
        didSet{
            guard let post = post else {return}
            label.text = post.name
            sublabel.text = post.nickName
            profileImage.image = UIImage(named: post.image)
            textView.text = post.text
        }
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Brian Voong"
        return label
    }()
    
    let sublabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.backgroundColor = .white
        label.text = "@buildthatapp"
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let separatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 2
        image.layer.masksToBounds = true
        image.image = UIImage(named: "starwars")
        return image
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .white
        textView.isEditable = false
        textView.text = "Should you learn both iOS and Android at the same time? I don't exactly recommend doing both straight out of college. Some behind the scenes of shooting YouTube videos."
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.contentInset = UIEdgeInsets(top: -10, left: -2, bottom: 0, right: 0)
        return textView
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor(red: 2/255, green: 160/255, blue: 237/255, alpha: 1).cgColor
        button.setTitle("  Follow", for: UIControlState.normal)
        button.setTitleColor(UIColor(red: 2/255, green: 160/255, blue: 237/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12.5)
        button.layer.borderWidth = 1
        return button
    }()
    
    let buttonImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 2
        image.layer.masksToBounds = true
        image.image = UIImage(named: "icon")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        self.addSubview(label)
        self.addSubview(profileImage)
        self.addSubview(sublabel)
        self.addSubview(textView)
        self.addSubview(button)
        self.addSubview(separatorView)
        self.addSubview(buttonImage)
        
        profileImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        label.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 5).isActive = true
        label.heightAnchor.constraint(equalToConstant: 17).isActive = true
        label.widthAnchor.constraint(equalToConstant:160).isActive = true
        label.topAnchor.constraint(equalTo: profileImage.topAnchor).isActive = true
        
        sublabel.leftAnchor.constraint(equalTo: label.leftAnchor).isActive = true
        sublabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        sublabel.rightAnchor.constraint(equalTo: label.rightAnchor).isActive = true
        sublabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 1).isActive = true
        
        textView.topAnchor.constraint(equalTo: sublabel.bottomAnchor, constant: 2).isActive = true
        textView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: sublabel.leftAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        button.leftAnchor.constraint(equalTo: sublabel.rightAnchor, constant: 20).isActive = true
        button.topAnchor.constraint(equalTo: label.topAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
        button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        
        separatorView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        buttonImage.centerXAnchor.constraint(equalTo: button.centerXAnchor, constant: -32).isActive = true
        buttonImage.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        buttonImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        buttonImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
}

class HeaderCell: UICollectionViewCell{
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "WHO TO FOLLOW"
        return label
    }()
    
    let separatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        self.addSubview(label)
        self.addSubview(separatorView)
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        label.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        separatorView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
}

class FooterCell: UICollectionViewCell{
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Show me more"
        label.textColor = UIColor(red: 2/255, green: 160/255, blue: 237/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13.5)
        return label
    }()
    
    let separatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let separatorViewFooter:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        self.addSubview(label)
        self.addSubview(separatorView)
        self.addSubview(separatorViewFooter)
        
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        label.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        separatorView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: self.topAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        separatorViewFooter.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        separatorViewFooter.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        separatorViewFooter.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        separatorViewFooter.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
}

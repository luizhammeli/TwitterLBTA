//
//  HeaderFooterCell.swift
//  twitter
//
//  Created by Dev iOS on 11/10/17.
//  Copyright © 2017 Dev iOS. All rights reserved.
//

import LBTAComponents

class UserHeader: DatasourceCell{
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = .white
        self.addSubview(titleLabel)
        titleLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

class UserFooter: DatasourceCell{
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.textColor = UIColor(r: 61, g: 167, b: 244)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        self.addSubview(titleLabel)
        self.backgroundColor = .white
        titleLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

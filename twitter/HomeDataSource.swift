//
//  HomeDataSource.swift
//  twitter
//
//  Created by Dev iOS on 10/10/17.
//  Copyright © 2017 Dev iOS. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let words = ["User1", "User2", "User3"]
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
}

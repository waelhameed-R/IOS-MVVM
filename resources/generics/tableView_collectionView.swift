//
//  tableView_collectionView.swift
//  app
//
//  Created by wael hameed on 2/9/22.
//

import Foundation
import UIKit

// TABLE VIEW DataSource 'Generic'
class tableViewDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource {
    
    private var numberOfSections : Int? = nil
    private var cellIdentifier : String!
    private var items : [T]!
    private var sectionTitles : [String]? = nil
    var configureCell : (CELL, T) -> () = {_,_ in }

    init(sectionTitles:[String]? = nil ,cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
        self.sectionTitles = sectionTitles
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if sectionTitles != nil {
            return sectionTitles?.count ?? 1
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles?[section] ?? ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
    
}

// COLLECTION VIEW DataSource 'Generic'
class CollectionViewDataSource<CELL : UICollectionViewCell,T> : NSObject, UICollectionViewDataSource {
    
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (CELL, T) -> () = {_,_ in }

    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CELL
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
}

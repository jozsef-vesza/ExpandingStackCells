//
//  MainViewModel.swift
//  ExpandingStackCells
//
//  Created by József Vesza on 27/06/15.
//  Copyright © 2015 Jozsef Vesza. All rights reserved.
//

import UIKit

struct MainViewModel {
    
    private let items = SimpleItemStore.defaultItems()
    
    func count() -> Int {
        return items.count
    }
    
    func titleForRow(row: Int) -> String {
        return items[row].title
    }
    
    func detailForRow(row: Int) -> String {
        return items[row].detail
    }
}
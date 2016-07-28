//
//  SimpleItemStore.swift
//  ExpandingStackCells
//
//  Created by József Vesza on 27/06/15.
//  Copyright © 2015 Jozsef Vesza. All rights reserved.
//

import UIKit

struct SimpleItemStore {
    static func defaultItems() -> [SimpleItem] {
        return [
            SimpleItem(title: "A really long item title for testing self-sizing mechanism", detail: "A really long detail title to test self-sizing mechanism"),
            SimpleItem(title: "Item 1", detail: "Detail 1"),
            SimpleItem(title: "Item 2", detail: "Detail 2"),
            
            SimpleItem(title: "A really long item title for testing self-sizing mechanism", detail: "A really long detail title to test self-sizing mechanism"),
            SimpleItem(title: "Item 1", detail: "Detail 1"),
            SimpleItem(title: "Item 2", detail: "Detail 2"),
            SimpleItem(title: "A really long item title for testing self-sizing mechanism", detail: "A really long detail title to test self-sizing mechanism"),
            SimpleItem(title: "Item 1", detail: "Detail 1"),
            SimpleItem(title: "Item 2", detail: "Detail 2"),
            SimpleItem(title: "A really long item title for testing self-sizing mechanism", detail: "A really long detail title to test self-sizing mechanism"),
            SimpleItem(title: "Item 1", detail: "Detail 1"),
            SimpleItem(title: "Item 2", detail: "Detail 2"),
        ]
    }
}
//
//  Category.swift
//  Todoey
//
//  Created by ESK on 09/02/19.
//  Copyright © 2019 indiana99. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var color: String = ""
    let items = List<Item>()
}

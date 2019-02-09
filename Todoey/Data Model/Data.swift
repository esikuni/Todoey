//
//  Data.swift
//  Todoey
//
//  Created by ESK on 09/02/19.
//  Copyright © 2019 indiana99. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}

//
//  FeedItem.swift
//  ExchangeAGram
//
//  Created by Beetu on 8/26/15.
//  Copyright (c) 2015 Brijrajsinh Gohil. All rights reserved.
//

import Foundation
import CoreData


@objc(FeedItem)
class FeedItem: NSManagedObject {

    @NSManaged var caption: String
    @NSManaged var image: NSData
    @NSManaged var latitude: NSNumber
    @NSManaged var longitude: NSNumber
    @NSManaged var thumbNail: NSData
    @NSManaged var uniqueID: String
    @NSManaged var filtered: NSNumber

}

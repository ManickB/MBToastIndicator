//
//  MBIndicator.swift
//  MToaster
//
//  Created by ViVID on 12/3/16.
//  Copyright © 2016 ViVID. All rights reserved.
//

import UIKit

class MBIndicator: NSObject {
    class func ToasterVariables(text : NSString, TypePosition : NSString)
    {
       let toast = MBToastIndicator()
        toast.getToaster(text, TypePosition: TypePosition)
    }
}

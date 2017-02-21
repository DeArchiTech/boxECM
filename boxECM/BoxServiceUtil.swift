//
//  Util.swift
//  IBMCaptureSDK-Sample
//
//  Created by David Kwok Ho Chan on 1/23/17.
//  Copyright © 2017 Future Workshops. All rights reserved.
//

import Foundation
import BoxContentSDK

class BoxServiceUtil{
    
    init(){
    }
    
    func getDateString() -> String{
        
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd-HH-mm"
        //"dd.MM.yy"
        return formatter.string(from: date as Date)
        
    }
    
    func getFileName() -> String{
        return "Le File Name" + String(arc4random_uniform(1000)) + ".jpg"
    }
    
    func getFolderName() -> String{
        return "Generic Folder name" + String(arc4random_uniform(1000))
    }
    
    func getFileID(file :BOXFile) -> String{
        return file.modelID!
    }
    
    func getMetaDataID(metaData: BOXMetadata) -> String{
        return metaData.jsonData["$id"] as! String
    }
    
    func getFolderID(folder: BOXFolder) -> String{
        return folder.modelID!
    }
    
    func getFolderName(dictionary : Dictionary<String,String>) -> String{
        if !dictionary.isEmpty {
            if dictionary["customername"] != nil{
                return dictionary["customername"]!
            }
        }
        return "Other"
    }
    
}

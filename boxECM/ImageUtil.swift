//
//  Util.swift
//  SDKSampleApp
//
//  Created by davix on 9/28/16.
//  Copyright © 2016 EMC Captiva. All rights reserved.
//

import Foundation
import UIKit

class ImageUtil{
    
    init(){
        
    }
    
    func createImageUploadParam(image: UIImage) -> Dictionary<String,String>{
        let baset64String = self.createBase64String(image : image)
        let dictionary = self.createImageUploadDictionary(string: baset64String)
        return dictionary
    }
    
    func createImageUploadParam(data: NSData) -> Dictionary<String,String>{
        let baset64String = self.createBase64String(data : data)
        let dictionary = self.createImageUploadDictionary(string: baset64String)
        return dictionary
    }
    
    func createImageUploadParam(base64Data: String) -> Dictionary<String,String>{
        let dictionary = self.createImageUploadDictionary(string: base64Data)
        return dictionary
    }
    
    func createBase64String(image : UIImage) -> String{
        let imageData:NSData = UIImageJPEGRepresentation(image,1.0)! as NSData
        return self.createBase64String(data: imageData)
    }
    
    func createBase64(image :UIImage) -> NSData{
        return UIImageJPEGRepresentation(image,1.0)! as NSData
    }
    
    func createBase64String(data : NSData) -> String{
        let option = NSData.Base64EncodingOptions.init(rawValue: 0)
        let strBase64 : String = data.base64EncodedString(options: option)
        return strBase64
    }
    
    func createImageUploadDictionary(string: String) -> Dictionary<String,String>{
        
        var result = [String: String]()
        result["data"] = string
        result["contentType"] = "image/jpeg"
        result["dispatch"] = "s"
        return result;
    }
    
    func createSmallFileSize(img : UIImage, size : Double) -> NSData{
        
        let fileSize = 1.1
        var imageQuality = 1.0
        var imageData : NSData?
        while(fileSize > 1.0){
            imageData = UIImageJPEGRepresentation(img , CGFloat(imageQuality))! as NSData
            let imgSize = self.getDataSize(data: imageData!)
            if imgSize < size{
                break
            }
            imageQuality = imageQuality - 0.1
        }
        return imageData!
    }
    
    func getDataSize(data : NSData) -> Double{
        
        let size:Int = data.length
        let result = Double(size)/(1024.0)
        return result
        
    }
    
}

//
//  OCRservice.swift
//  IBMCaptureSDK-Sample
//
//  Created by David Kwok Ho Chan on 2/15/17.
//  Copyright © 2017 Future Workshops. All rights reserved.
//

import Foundation
import Alamofire

class OCRservice{
    
    let endpoint = Constants.ocrEndPt
    let apiKey = Constants.ocrApiKey
    let language = "eng"
    
    func performOCR(image : UIImage, completion: ((AnyObject?) -> Void)!){
        
        let multipart = self.createMultipart(image: image)
        let convertible = self.createURL()
        let completion = self.createCompletion(completion: completion)
        Alamofire.upload(multipartFormData: multipart, to: self.createURL(), encodingCompletion: completion)
    
    }
    
    func createURL() -> URLConvertible{
        
        let url : URLConvertible = URL.init(string: self.endpoint)!
        return url
    }
    
    func createMultipart(image : UIImage) -> ((MultipartFormData) -> Void){
        
        let params = self.createParam()
        return {MultipartFormData in
            for (key, value) in params {
                let value : Data = value.data(using: String.Encoding.utf8.rawValue)!
                MultipartFormData.append(value, withName: key)
            }
            let imageData : Data = self.createImageData(img: image) as Data
            MultipartFormData.append(imageData, withName: "image", fileName: "metroClearImg.jpg", mimeType: "image/jpg")
        }
        
    }
    
    func createCompletion(completion: ((AnyObject?) -> Void)!) -> ((SessionManager.MultipartFormDataEncodingResult) -> Void)?{
        
        return { (result) in
            
            switch result {
            case SessionManager.MultipartFormDataEncodingResult.success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                
                upload.responseJSON { response in
                    completion(response.response)
                }
                
            case SessionManager.MultipartFormDataEncodingResult.failure(let encodingError):
                print(encodingError)
            }
        }
    }
    
    func createParam() -> [String : AnyObject]{
        
        var dictionary = [String : AnyObject]()
        dictionary["language"] = self.language as AnyObject?
        dictionary["apikey"] = self.apiKey as AnyObject?
        dictionary["isoverlayrequired"] = "false" as AnyObject?
        return dictionary
        
    }
    
    func createImageData(img : UIImage) -> Data{
        
        return UIImageJPEGRepresentation(img ,0.7 )!
        
    }
    
}

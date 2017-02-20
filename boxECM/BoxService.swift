//
//  BoxService.swift
//  IBMCaptureSDK-Sample
//
//  Created by davix on 12/15/16.
//  Copyright © 2016 Future Workshops. All rights reserved.
//

import Foundation
import BoxContentSDK

class BoxService{
    
    let client_id = "6rassr1x5u0zic78ra1r7n83grn0v5yd"
    let client_secret = "4Y9RpnpW2YVFpPwYytI0wLIEQWO9r6y5"
    var client : BOXContentClient?
    
    init() {
    }
    
    func authenticate(completion: @escaping ((BOXUser?, Error?) -> Void)){
        
        BOXContentClient.setClientID(self.client_id, clientSecret: self.client_secret)
        self.client = BOXContentClient.default()
        self.client?.authenticate(){
            (user, error) in
            completion(user, error)
        }
    
    }
    
    func authenticateWithNewUser(completion: @escaping ((BOXUser?, Error?) -> Void)){
        
        //:TODO Implement
        BOXContentClient.setClientID(self.client_id, clientSecret: self.client_secret)
        self.client = BOXContentClient.forNewSession()
        self.client?.authenticate(){
            (user, error) in
            completion(user,error)
        }
        
    }
    
    func upload(data: NSData, folderID: String, fileName: String, completion: @escaping ((BOXFile?, Error) -> Void), block : BOXFileBlock!){
        
        let client = BOXContentClient.default()
        //Please remember to authenticate
        //Todo: Add A Guard Statement
        let request = client?.fileUploadRequestToFolder(withID: folderID, from: data as Data!, fileName: fileName)
        let progressBlock : BOXProgressBlock? = { (a,b) in }
        request?.perform(progress: progressBlock, completion: block)
        
    }
    
}

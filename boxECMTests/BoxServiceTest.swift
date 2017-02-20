//
//  IBMCaptureSDK_SampleTests.swift
//  IBMCaptureSDK-SampleTests
//
//  Created by davix on 12/15/16.
//  Copyright © 2016 Future Workshops. All rights reserved.
//

import XCTest
import BoxContentSDK
@testable import boxECM

class BoxServiceTest: XCTestCase {
    
    var service : BoxService?
    var folderID = "0"
    
    override func setUp() {
        super.setUp()
        self.service = BoxService.init()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAuthenticate() {
        let exp = expectation(description: "Some Expectation To Be Filled")
        self.service?.authenticate(){
            (user,error) in
            self.validateResults(user, error: error)
            exp.fulfill()
        }
        waitForExpectations(timeout: 60, handler: { error in
            XCTAssertNil(error, "Error")})
        
    }
    
    func testUploadWithNSData() {
        
        let exp = expectation(description: "Some Expectation To Be Filled")
        //1)First Authenticate
        self.service?.authenticate(){
            (user,error) in
            self.validateResults(user, error: error as NSError?)
            //2)Second Upload After Being Authenticated
            var completion : ((BOXFile? , Error) -> Void) = {
                (file,error) in
                //3)Assert After Files being uploaded
                self.validateResults(file, error: error)
                exp.fulfill()
            }
            let fileBlock : BOXFileBlock = {
                (file,error) in
                //3)Assert After Files being uploaded
                self.validateResults(file, error: error)
                exp.fulfill()
            }
            self.service?.upload(data: self.getImageData() as NSData, folderID: self.folderID, fileName: self.getFileName(), completion: completion, block: fileBlock)

        }
        waitForExpectations(timeout: 60, handler: { error in
            XCTAssertNil(error, "Error")})
    }
    
    func validateResults(_ object : AnyObject?, error : Error?){
        if error != nil {
            print(error)
        }
        XCTAssertNotNil(object)
        XCTAssertNil(error)
    }
    
    func getFileName() -> String{
        
        return "Le File Name" + String(arc4random_uniform(100))
        
    }
    
    func getImageData() -> Data{
        
        let bundle = Bundle(for: type(of: self))
        let img = UIImage(named: "testImg.jpg", in: bundle, compatibleWith: nil)
        let imgData:Data = UIImageJPEGRepresentation(img!, 1.0)! as Data
        return imgData
        
    }
}

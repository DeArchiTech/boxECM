//
//  CustomerRepositoryTest.swift
//  IBMCaptureSDK-Sample
//
//  Created by David Kwok Ho Chan on 1/23/17.
//  Copyright © 2017 Future Workshops. All rights reserved.
//
import XCTest
@testable import boxECM

class OCRserviceTest: XCTestCase{
    
    var service : OCRservice?
    
    override func setUp() {
        super.setUp()
        self.service = OCRservice.init()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPerformOcr(){
        
        let exp = expectation(description: "Some Expectation To Be Filled")
        self.service?.performOCR(image: self.getTestImg()){
            (object) in
            XCTAssertNotNil(object)
            print(object)
            exp.fulfill()
        }
        waitForExpectations(timeout: 60, handler: { error in
            XCTAssertNil(error, "Error")})
        
    }
    
    func testCreateParam(){
        
        let param = self.service?.createParam()
        XCTAssertNotNil(param)
        
    }
    
    func getTestImg() -> UIImage{
        
        let bundle = Bundle(for: type(of: self))
        return UIImage(named: "metroPod2.png", in: bundle, compatibleWith: nil)!
        
    }
}

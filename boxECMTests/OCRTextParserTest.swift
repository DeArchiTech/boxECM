//
//  OCRTextParserTest.swift
//  IBMCaptureSDK-Sample
//
//  Created by David Kwok Ho Chan on 2/15/17.
//  Copyright © 2017 Future Workshops. All rights reserved.
//
import XCTest
@testable import boxECM

class OCRTextParserTest: XCTestCase{
    
    var service : OCRTextParser?
    
    override func setUp() {
        super.setUp()
        self.service = OCRTextParser.init()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testParseText(){
        
        //1) Load in the JSON file
        let dict = self.loadInJsonData()
        XCTAssertNotNil(dict)
        //2) Load in the string
        let text = self.getParseStringFromDictionary(dict: dict!)
        XCTAssertNotNil(text)
        //3) Call service
        let result = self.service?.parseText(key: "FACTURE #", ocrText: text)
        //4) Validate the result
        let expected = "0007518729"
        XCTAssertEqual(result, expected)
        
    }
    
    func getParseStringFromDictionary(dict : NSDictionary) -> String{
        
        let innerArray : NSArray = dict["ParsedResults"] as! NSArray
        let innerDict : NSDictionary = innerArray.firstObject as! NSDictionary
        let parsedText : String = innerDict["ParsedText"] as! String
        return parsedText
        
    }
    
    
    
    func loadInJsonData() -> NSDictionary?{
        
        if let path = Bundle.main.path(forResource: "parseText", ofType: "json")
        {
            if let jsonData = NSData(contentsOfFile: path)
            {
                let jsonResult : NSDictionary?
                do{
                    jsonResult = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    return jsonResult
                }catch{
                    print("An Error has occured")
                }
            }
        }
        return nil
        
    }
    
}

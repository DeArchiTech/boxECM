//
//  OCRServiceSpec.swift
//  boxECM
//
//  Created by David Kwok Ho Chan on 2/21/17.
//  Copyright © 2017 revasolutions. All rights reserved.
//
import Foundation
import Quick
import Nimble
@testable import boxECM

class OCRServiceSpec: QuickSpec{
    
    override func spec(){
        describe("Perform OCR"){
            let exp = expectation(description: "Some Expectation To Be Filled")
            it("should return the parsed text in a json"){
                let service = OCRservice.init()
                let bundle = Bundle(for: type(of: self))
                let image = UIImage(named: "metroPod2.png", in: bundle, compatibleWith: nil)!
                service.performOCR(image: image){ result in
                    print(result)
                    expect(result).toNot(beNil())
                }
            }
        }

    }

}

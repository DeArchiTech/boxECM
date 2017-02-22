//
//  ScreenSelectionVCSpec.swift
//  boxECM
//
//  Created by David Kwok Ho Chan on 2/21/17.
//  Copyright © 2017 revasolutions. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import boxECM

class ImageSelectionVCSpec: QuickSpec{
    
    override func spec() {
    var vc : UIViewController?
    var nc : UINavigationController?
    var ivc : ImageSelectionViewController?
    var subject : ImageSelectionViewController?
    
    beforeEach {
        //Set up view controller from Story Board
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self)))
        nc = storyboard.instantiateInitialViewController() as? UINavigationController
        vc = storyboard.instantiateViewController(withIdentifier: "ImageSelectionViewController")
        ivc = ImageSelectionViewController()
        UIApplication.shared.keyWindow!.rootViewController = nc
        let _ = nc?.view
        let _ = vc?.view
        expect(nc).toNot(beNil())
        expect(vc).toNot(beNil())
        expect(ivc).toNot(beNil())
        subject = ivc
    }
    
    describe(".cameraAction()"){
        context("success case"){
            it("should open the camera"){
                let completion : ((Any) -> Void) = { result in
                    expect(result).toNot(beNil())
                }
                subject!.openCamera(completion: completion)
            }
        }
        context("failure case"){
            it("should alert failure"){
                
            }
        }
    }
    }
}

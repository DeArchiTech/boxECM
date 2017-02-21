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
        var vc : ImageSelectionViewController?
        beforeEach {
            //Set up view controller from Story Board
            let storyboard = UIStoryboard(name: "Main",
                                          bundle: Bundle(for: type(of: self)))
            let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
            vc = navigationController.topViewController as! ImageSelectionViewController
            
            UIApplication.shared.keyWindow!.rootViewController = navigationController
            let _ = navigationController.view
            let _ = vc?.view
        }
        describe(".cameraAction()"){
            it("should open the camera"){
                expect(vc).toNot(beNil())
            }
        }
    }
}

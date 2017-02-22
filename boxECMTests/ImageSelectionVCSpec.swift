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
    
    beforeEach {
        //Set up view controller from Story Board
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self)))
        nc = storyboard.instantiateInitialViewController() as? UINavigationController
        vc = storyboard.instantiateViewController(withIdentifier: "ImageSelectionViewController")
        UIApplication.shared.keyWindow!.rootViewController = nc
        let _ = nc?.view
        let _ = vc?.view
    }
    
    describe(".cameraAction()"){
        it("should open the camera"){
            expect(nc).toNot(beNil())
            expect(vc).toNot(beNil())
            let ivc : ImageSelectionViewController = vc as ImageSelectionViewController?
            expect(ivc).toNot(beNil())
        }
    }
}
    
}

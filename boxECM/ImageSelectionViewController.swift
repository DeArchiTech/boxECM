//
//  ImageSelectionViewController.swift
//  boxECM
//
//  Created by David Kwok Ho Chan on 2/21/17.
//  Copyright © 2017 revasolutions. All rights reserved.
//

import UIKit

class ImageSelectionViewController: UIViewController,  UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openCamera(completion : ((Any?) -> Void)?){
        
        if UIImagePickerController.availableCaptureModes(for: .rear) != nil {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: {completion!(true)})
        }else{
            //self.pushImageEditViewController(UIImage(named: "pod")!)
        }
        
    }
}


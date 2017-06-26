//
//  PenguinViewController.swift
//  PenguinCollector
//
//  Created by Toby Zitsman on 6/26/17.
//  Copyright © 2017 Toby Zitsman. All rights reserved.
//

import UIKit

class PenguinViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var penguinImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func addTapped(_ sender: Any) {
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
}

//
//  PenguinViewController.swift
//  PenguinCollector
//
//  Created by Toby Zitsman on 6/26/17.
//  Copyright © 2017 Toby Zitsman. All rights reserved.
//

import UIKit

class PenguinViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var addUpdateButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var penguinImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var penguin : Penguin? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        if penguin != nil {
            penguinImageView.image = UIImage(data: penguin!.image! as Data)
            titleTextField.text = penguin?.title
            addUpdateButton.setTitle("Update", for: .normal)
        } else {
            deleteButton.isHidden = true
        }
        // D o any additional setup after loading the view.
    }


    
    @IBAction func addTapped(_ sender: Any) {
        
        if penguin != nil {
            penguin!.title = titleTextField.text
            penguin!.image = UIImagePNGRepresentation(penguinImageView.image!)!as NSData
        } else {
        
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let penguin = Penguin(context: context)
            penguin.title = titleTextField.text
            penguin.image = UIImagePNGRepresentation(penguinImageView.image!)!as NSData
        }
        

        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        penguinImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(penguin!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)

    }
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera

        present(imagePicker, animated: true, completion: nil)
    }
}

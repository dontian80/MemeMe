//
//  ViewController.swift
//  MemeMe
//
//  Created by Don Tian on 11/26/16.
//  Copyright © 2016 Don Tian. All rights reserved.
//

import UIKit

class MemeEditorViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var selectedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectImageFromCamera(_ sender: Any) {
        selectImageFromSource(UIImagePickerControllerSourceType.camera)
    }

    @IBAction func selectImageFromAlbum(_ sender: Any) {
        selectImageFromSource(UIImagePickerControllerSourceType.savedPhotosAlbum)
    }
    
    func selectImageFromSource(_ sourceType: UIImagePickerControllerSourceType) {
        if (UIImagePickerController.isSourceTypeAvailable(sourceType)) {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = sourceType
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        } else {
            showAlert("Source Not Available", message: "This image source is not availabe on your device.")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            selectedImageView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func showAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}


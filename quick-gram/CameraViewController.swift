//
//  CameraViewController.swift
//  quick-gram
//
//  Created by Jonathan on 3/7/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var commentField: UITextField!
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }
        else{
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 343,height:300)
        let scaledImage = image.af_imageScaled(to: size)
        postImageView.image = scaledImage
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onSubmit(_ sender: Any) {
        let post = PFObject(className: "Posts")
        post["caption"] = commentField.text!
        post["author"] = PFUser.current()!
        
        let imageData = postImageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        
        post["image"] = file
        post.saveInBackground{
            (success, error) in
            if success{
                self.dismiss(animated: true, completion: nil)
                print("Saved")
            }
            else{
                print("Error \(error ?? "Error couldn't saved to database" as! Error)")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

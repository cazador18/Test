//
//  ProfileViewController.swift
//  selfpractice
//
//  Created by Erzhan Kasymov on 2/2/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var avatarImage: UIImageView!
    
    let identifire = "PhotoCollectionViewCell"
    let photoGallery = PhotoGallery()
    
    let countCells = 3
    let offset:CGFloat = 2.0
    
    let imagePicker  = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        avatarImage.layer.borderWidth = 3.0
        avatarImage.layer.borderColor = UIColor.lightGray.cgColor
        collectionView.delegate = self
        collectionView.dataSource = self
        imagePicker.delegate = self
    
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifire)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnImage(_ :)))
        avatarImage.addGestureRecognizer(tapGesture)
        avatarImage.isUserInteractionEnabled = true
    
    }
    @objc func tapOnImage(_ sender:UITapGestureRecognizer){
        let alert = UIAlertController(title: "Image", message: nil, preferredStyle: .actionSheet)
        let actionPhoto = UIAlertAction(title: "From Gallery", style: .default) { (alert) in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let actionCamera = UIAlertAction(title: "From Camera", style: .default) { (alert) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actionPhoto)
        alert.addAction(actionCamera)
        alert.addAction(actionCancel)

        present(alert, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        if let name = UserDefaults.standard.string(forKey: "nameKey"){
            nameLabel.text = name
        }
    }


}
extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifire, for: indexPath) as! PhotoCollectionViewCell
        cell.photoView.image = photoGallery.images[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let frameCV = collectionView.frame.size
        let widthCell = frameCV.width / CGFloat(countCells)
        let heightCell = widthCell
        
        let spacing = CGFloat((countCells + 1)) * offset / CGFloat(countCells)
        
        
        return CGSize(width: widthCell - spacing, height: heightCell - (offset*2))
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc  = storyboard?.instantiateViewController(withIdentifier: "FullScreenViewController") as! FullScreenViewController
        vc.photoGallery = photoGallery
        vc.indexPath = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension ProfileViewController:UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            avatarImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
}

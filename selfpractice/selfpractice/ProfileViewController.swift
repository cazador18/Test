//
//  ProfileViewController.swift
//  selfpractice
//
//  Created by Erzhan Kasymov on 2/2/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var avatarImage: UIImageView!
    
    let identifire = "PhotoCollectionViewCell"
    let photoGallery = PhotoGallery()
    let countCells = 3
    let offset:CGFloat = 2.0
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImage.layer.borderWidth = 3.0
        avatarImage.layer.borderColor = UIColor.lightGray.cgColor
        collectionView.delegate = self
        collectionView.dataSource = self
    
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifire)
    }


}
extension ProfileViewController: UICollectionViewDataSource,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return photoGallery.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifire, for: indexPath) as! PhotoCollectionViewCell
        cell.photoView.image = photoGallery.images[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        let widthCell = frameCV.width / CGFloat(countCells)
        let heightCell = widthCell
         let spacing =  CGFloat((countCells + 1)) * offset / CGFloat(countCells)
        return CGSize( width: widthCell - spacing, height: heightCell - (offset*2))
    }
    
    
}

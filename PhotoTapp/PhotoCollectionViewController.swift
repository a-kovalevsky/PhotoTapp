//
//  PhotoCollectionViewController.swift
//  PhotoTapp
//
//  Created by andrew on 11.04.22.
//

import UIKit



class PhotoCollectionViewController: UICollectionViewController {

    let itemsPerRow: CGFloat = 2
    let inserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    let photosArr = ["dog1","dog2","dog3","dog4","dog5","dog6","dog7","dog8","dog9","dog10","dog11","dog12","dog13","dog14","dog15"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 70, height: 30)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.collectionView?.showsVerticalScrollIndicator = false
        */
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickPhotoSegue" {
            let photoFocus = segue.destination as! PhotoViewController
            let cell = sender as! PhotoCell
            photoFocus.image = cell.imageV.image
        }
    }

   	

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photosArr.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        let imageName = photosArr[indexPath.item]
        let image = UIImage(named: imageName)
        cell.imageV.image = image
    
        // Configure the cell
    
        return cell
    }

}
 extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = inserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return inserts
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return inserts.left
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return inserts.left
    }
}


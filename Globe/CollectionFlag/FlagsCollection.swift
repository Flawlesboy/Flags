//
//  FlagsCollection.swift
//  Globe
//
//  Created by zagid on 22.10.17.
//  Copyright © 2017 zagid. All rights reserved.
//

import UIKit
import SWRevealViewController
import Parse

class FlagsCollection: UICollectionViewController {
    
    var globes: [Globe] = []
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    
    private let leftAndRightPaddings: CGFloat = 40.0
    private let numberOfItemsPerRow: CGFloat = 3.0
    private let heigthAdjustment: CGFloat = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (collectionView!.frame.width - leftAndRightPaddings) / numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: width, height: width + heigthAdjustment)
        
        if self.revealViewController() != nil {
            menuBarButton.target = self.revealViewController()
            menuBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        requestGlobe()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    func requestGlobe() {
        let query = PFQuery(className: "Globe")
        query.order(byDescending: "createdAt")
        query.findObjectsInBackground { (objects, error) in
            
            if error == nil {
                
                if let retutnobjects = objects {
                    for object in retutnobjects {
                        let userImageFile = object["image"] as! PFFile
                        
                        userImageFile.getDataInBackground(block: { [weak self] (data, error) in
                            let image = UIImage(data: data!)!
                            
                            let globe = Globe(countryName: object["countryName"] as? String ?? "",  codeNumber: Int(object["codeNumber"] as! NSNumber) , image: image, capital: object["capital"] as? String ?? "", area: Int (object["area"] as! NSNumber) , population: Int(object["population"] as! NSNumber) )
                            self?.globes.append(globe)
                            
//                            print(retutnobjects)
                            
                            self?.collectionView?.reloadData()
                        })

                    }
                }
            }
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return globes.count
    }
    
    
    override func  collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FlagCollectionCell
        
        let globe = globes[indexPath.item]
        cell.imageView.image = globe.image
        
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let globe = globes[indexPath.item]
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        detailVC.globe = globe
        navigationController?.pushViewController(detailVC, animated: true)
//        self.present(detailVC, animated: true, completion: nil)
    }
    
    
    
    
}

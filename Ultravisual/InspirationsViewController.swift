//
//  InspirationsViewController.swift
//  RWDevCon
//
//  Created by Mic Pringle on 02/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class InspirationsViewController: UICollectionViewController {
  
  let inspirations = Inspiration.allInspirations()
  
  override var preferredStatusBarStyle : UIStatusBarStyle {
    return UIStatusBarStyle.lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let patternImage = UIImage(named: "Pattern") {
      view.backgroundColor = UIColor(patternImage: patternImage)
    }
    collectionView!.backgroundColor = UIColor.clear
    collectionView!.decelerationRate = UIScrollViewDecelerationRateFast
  }

}

// MARK: - UICollectionViewDataSource
extension InspirationsViewController {
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return inspirations.count
  }
  
  override func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InspirationCell", for: indexPath) as! InspirationCell
    cell.inspiration = inspirations[indexPath.item]
    
    return cell
  }

}

// MARK: - UICollectionViewDelegate
extension InspirationsViewController {
  
  override func collectionView(_ collectionView: UICollectionView,
                               didSelectItemAt indexPath: IndexPath) {
    let layout = collectionViewLayout as! UltravisualLayout
    let offset = layout.dragOffset * CGFloat(indexPath.item)
    if collectionView.contentOffset.y != offset {
      collectionView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
    }
    //This didn't work beacuse of the changing hights of the cells.
    //collectionView.scrollToItemAtIndexPath(indexPath,
    //                                       atScrollPosition: UICollectionViewScrollPosition.Top,
    //                                       animated: true)
  }
}

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
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let patternImage = UIImage(named: "Pattern") {
      view.backgroundColor = UIColor(patternImage: patternImage)
    }
    collectionView!.backgroundColor = UIColor.clearColor()
    collectionView!.decelerationRate = UIScrollViewDecelerationRateFast
  }

}

// MARK: - UICollectionViewDataSource
extension InspirationsViewController {
  
  override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return inspirations.count
  }
  
  override func collectionView(collectionView: UICollectionView,
                               cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("InspirationCell", forIndexPath: indexPath) as! InspirationCell
    cell.inspiration = inspirations[indexPath.item]
    
    return cell
  }

}

// MARK: - UICollectionViewDelegate
extension InspirationsViewController {
  
  override func collectionView(collectionView: UICollectionView,
                               didSelectItemAtIndexPath indexPath: NSIndexPath) {
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
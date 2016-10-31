//
//  TutorialCell.swift
//  RWDevCon
//
//  Created by Mic Pringle on 27/02/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class InspirationCell: UICollectionViewCell {
  
  @IBOutlet fileprivate weak var imageView: UIImageView!
  @IBOutlet fileprivate weak var imageCoverView: UIView!
  @IBOutlet fileprivate weak var titleLabel: UILabel!
  @IBOutlet fileprivate weak var timeAndRoomLabel: UILabel!
  @IBOutlet fileprivate weak var speakerLabel: UILabel!
  
  var inspiration: Inspiration? {
    didSet {
      if let inspiration = inspiration {
        imageView.image = inspiration.backgroundImage
        titleLabel.text = inspiration.title
        timeAndRoomLabel.text = inspiration.roomAndTime
        speakerLabel.text = inspiration.speaker
      }
    }
  }
  override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
    super.apply(layoutAttributes)
    
    // 1
    let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
    let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
    
    // 2
    let delta = 1 - ((featuredHeight - frame.height) / (featuredHeight - standardHeight))
    
    // 3
    let minAlpha: CGFloat = 0.3
    let maxAlpha: CGFloat = 0.75
    imageCoverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
    
    let scale = max(delta, 0.5)
    titleLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
    
    timeAndRoomLabel.alpha = delta
    speakerLabel.alpha = delta
  }
  
}

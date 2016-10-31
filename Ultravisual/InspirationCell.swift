//
//  TutorialCell.swift
//  RWDevCon
//
//  Created by Mic Pringle on 27/02/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class InspirationCell: UICollectionViewCell {
  
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var imageCoverView: UIView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var timeAndRoomLabel: UILabel!
  @IBOutlet private weak var speakerLabel: UILabel!
  
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
  override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
    super.applyLayoutAttributes(layoutAttributes)
    
    // 1
    let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
    let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
    
    // 2
    let delta = 1 - ((featuredHeight - CGRectGetHeight(frame)) / (featuredHeight - standardHeight))
    
    // 3
    let minAlpha: CGFloat = 0.3
    let maxAlpha: CGFloat = 0.75
    imageCoverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
    
    let scale = max(delta, 0.5)
    titleLabel.transform = CGAffineTransformMakeScale(scale, scale)
    
    timeAndRoomLabel.alpha = delta
    speakerLabel.alpha = delta
  }
  
}

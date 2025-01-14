//
//  PointView.swift
//  FirstCitizen
//
//  Created by Lee on 20/08/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit
import SnapKit

class PointView: UIView {
  
  private let cardView = UIView()
  private let gradient = CAGradientLayer()
  
  private let titleLabel = UILabel()
  private let pointLabel = UILabel()
  private let subLabel = UILabel()
  
  private let imageView = UIImageView()
  let button = UIButton()
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    
    let temp = UICollectionView(frame: .zero, collectionViewLayout: layout)
    temp.contentInset = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    
    return temp
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
    autoLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    gradient.startPoint = CGPoint(x: 1, y: 0)
    gradient.endPoint = CGPoint(x: 0, y: 1)
    gradient.colors = [
      UIColor(hexString: "001182").cgColor,
      UIColor(hexString: "020626").cgColor
    ]
    gradient.locations = [0, 1]
    gradient.frame = CGRect(origin: .zero, size: cardView.frame.size)
    
    cardView.layer.addSublayer(gradient)
    
  }
  
  private func configure() {
    cardView.layer.cornerRadius = 16
    cardView.layer.masksToBounds = true
//    self.addSubview(cardView)
    
    
    titleLabel.text = "업's"
    titleLabel.textColor = .white
    titleLabel.upsFontHeavy(ofSize: 25)
//    self.addSubview(titleLabel)
    
    pointLabel.text = "1750"
    pointLabel.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    pointLabel.upsFontHeavy(ofSize: 30)
    
    
    subLabel.text = "kira1021@gmail.com"
    subLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//    self.addSubview(subLabel)
    
    imageView.image = #imageLiteral(resourceName: "stamp")
    imageView.contentMode = .scaleAspectFit
  }
  
  private struct Standard {
    static let space: CGFloat = 8
    static let xSpace: CGFloat = 40
    static let ySpace: CGFloat = 32
    
    static let cardSpace: CGFloat = 40
    static let cardHeight: CGFloat = 160
    static let cardContentSpace: CGFloat = 16
  }
  
  private func autoLayout() {
    
    [cardView, titleLabel, pointLabel, subLabel, imageView, button, collectionView].forEach { self.addSubview($0) }
    
    cardView.snp.makeConstraints {
      $0.top.leading.equalTo(self).offset(Standard.cardSpace)
      $0.trailing.equalTo(self).offset(-Standard.cardSpace)
      $0.height.equalTo(Standard.cardHeight)
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.leading.equalTo(cardView).offset(Standard.cardContentSpace)
    }
    
    pointLabel.translatesAutoresizingMaskIntoConstraints = false
    pointLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
    pointLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor).isActive = true
    
    subLabel.snp.makeConstraints {
      $0.leading.equalTo(cardView).offset(Standard.cardContentSpace)
      $0.bottom.equalTo(cardView).offset(-Standard.cardContentSpace)
    }
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: Standard.ySpace).isActive = true
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
  }
}

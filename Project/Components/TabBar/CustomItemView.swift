//
//  CustomItemView.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 12/09/22.
//

import Foundation
import UIKit

final class CustomItemView: UIView {
    
    private let nameLabel = UILabel()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        return imageView
    }()
    
    private let underlineView: UIView = .init()
    private let containerView: UIView = .init()
    let index: Int
    
    var isSelected = false {
        didSet {
            animateItems()
        }
    }
    
    private let item: CustomTabItem
    
    init(with item: CustomTabItem, index: Int) {
        self.item = item
        self.index = index
        super.init(frame: .zero)
        buildHierarchy()
        setupConstraints()
        setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildHierarchy() {
        addSubview(containerView)
        containerView.addSubviews(nameLabel, iconImageView, underlineView)
    }
    
    private func setupConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            make.top.equalToSuperview()
            make.bottom.equalTo(nameLabel.snp.top)
            make.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(16)
        }
        
        underlineView.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.height.equalTo(8)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(nameLabel.snp.centerY)
        }
    }
    
    private func setupProperties() {
        nameLabel.configureWith(item.name,
                                color: .black.withAlphaComponent(0.4),
                                alignment: .center,
                                size: 11,
                                weight: .semibold)
        underlineView.backgroundColor = .black
        underlineView.setupCornerRadius(2)
        
        iconImageView.image = isSelected ? item.selectedIcon : item.icon
    }
    
    private func animateItems() {
        UIView.animate(withDuration: 0.4) { [unowned self] in
            self.nameLabel.alpha = self.isSelected ? 0.0 : 1.0
            self.underlineView.alpha = self.isSelected ? 1.0 : 0.0
        }
        UIView.transition(with: iconImageView,
                          duration: 0.4,
                          options: .transitionCrossDissolve) { [unowned self] in
            self.iconImageView.image = self.isSelected ? self.item.selectedIcon : self.item.icon
        }
    }
}

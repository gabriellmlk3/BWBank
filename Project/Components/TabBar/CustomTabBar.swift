//
//  CustomTabBar.swift
//  MyProject
//
//  Created by Gabriel Olbrisch on 12/09/22.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxGesture

final class CustomTabBar: UIStackView {
    
    var itemTapped: Observable<Int> { itemTappedSubject.asObservable() }
    
    private lazy var customItemViews: [CustomItemView] = [homeItem, homeItem2]
    
    private let homeItem = CustomItemView(with: .home, index: 0)
    private let homeItem2 = CustomItemView(with: .home, index: 1)
    
    private let itemTappedSubject = PublishSubject<Int>()
    private let disposeBag = DisposeBag()
    
    init() {
        super.init(frame: .zero)
        buildHierarchy()
        setupProperties()
        bind()
        setNeedsLayout()
        layoutIfNeeded()
        selectItem(index: 0)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildHierarchy() {
        addArrangedSubviews(customItemViews)
    }
    
    private func setupProperties() {
        distribution = .fillEqually
        alignment = .center
        clipsToBounds = true
        backgroundColor = .white
        setupCornerRadius(15)
        
        customItemViews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.clipsToBounds = true
        }
    }
    
    private func selectItem(index: Int) {
        customItemViews.forEach { $0.isSelected = $0.index == index }
        itemTappedSubject.onNext(index)
    }
    
    //MARK: - Bindings
    
    private func bind() {
        homeItem.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                self?.selectItem(index: self?.homeItem.index ?? 0)
            }
            .disposed(by: disposeBag)
        
        homeItem2.rx.tapGesture()
            .when(.recognized)
            .bind { [weak self] _ in
                self?.selectItem(index: self?.homeItem2.index ?? 0)
            }
            .disposed(by: disposeBag)
    }

}

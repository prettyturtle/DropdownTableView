//
//  MainTableViewHeaderView.swift
//  DropdownTableView
//
//  Created by yc on 2022/01/09.
//

import UIKit
import SnapKit

protocol MainTableViewHeaderViewDelegate {
    func didTapMainTableViewHeaderView(index: Int)
}

class MainTableViewHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "MainTableViewHeaderView"
    
    var delegate: MainTableViewHeaderViewDelegate?
    
    private lazy var sectionTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "sectionTitle"
        label.font = .systemFont(ofSize: 18.0, weight: .semibold)
        
        return label
    }()
    
    private lazy var indicatorImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.tintColor = .tertiaryLabel
        
        return imageView
    }()
    
    func setupView(section: Int) {
        setupLayout()
        
        self.tag = section
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapMainTableViewHeaderView))
        addGestureRecognizer(tap)
    }
    func changeIndicatorImageView() {
        indicatorImageView.image = UIImage(systemName: "chevron.up")
    }
    
    @objc func didTapMainTableViewHeaderView() {
        delegate?.didTapMainTableViewHeaderView(index: self.tag)
    }
}

private extension MainTableViewHeaderView {
    func setupLayout() {
        [
            sectionTitleLabel,
            indicatorImageView
        ].forEach { addSubview($0) }
        
        sectionTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16.0)
            make.top.bottom.equalToSuperview().inset(8.0)
        }
        indicatorImageView.snp.makeConstraints { make in
            make.width.height.equalTo(20.0)
            make.trailing.equalToSuperview().inset(16.0)
            make.centerY.equalTo(sectionTitleLabel)
        }
    }
}

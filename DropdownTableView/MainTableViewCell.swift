//
//  MainTableViewCell.swift
//  DropdownTableView
//
//  Created by yc on 2022/01/09.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {
    
    static let identifier = "MainTableViewCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "cell"
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        
        return label
    }()
    
    func setupView() {
        setupLayout()
        backgroundColor = .secondarySystemBackground
    }
}

private extension MainTableViewCell {
    func setupLayout() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(48.0)
            make.top.bottom.equalToSuperview().inset(8.0)
        }
    }
}

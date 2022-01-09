//
//  MainViewController.swift
//  DropdownTableView
//
//  Created by yc on 2022/01/09.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private var currentTappedSectionIndex: Int? = nil
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: MainTableViewHeaderView.identifier)
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
}
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MainTableViewHeaderView.identifier) as? MainTableViewHeaderView else { return UIView() }
        
        header.setupView(section: section)
        header.delegate = self
        if currentTappedSectionIndex == section {
            header.changeIndicatorImageView()
        }
        
        return header
    }
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == currentTappedSectionIndex {
            return 3
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        cell.setupView()
        
        return cell
    }
}

extension MainViewController: MainTableViewHeaderViewDelegate {
    func didTapMainTableViewHeaderView(index: Int) {
        switch currentTappedSectionIndex {
        case nil: // 처음 눌렀을 때
            currentTappedSectionIndex = index
            tableView.reloadSections([index], with: .automatic)
        case index: // 눌려있는 것을 눌렀을 때
            currentTappedSectionIndex = nil
            tableView.reloadSections([index], with: .automatic)
        default: // 닫혀있는 다른 것을 눌렀을 때
            let willClosedSectionIndex = currentTappedSectionIndex!
            currentTappedSectionIndex = index
            tableView.reloadSections([willClosedSectionIndex, index], with: .automatic)
        }
    }
}

private extension MainViewController {
    func setupLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

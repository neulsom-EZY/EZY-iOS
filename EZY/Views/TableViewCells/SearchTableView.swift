//
//  SearchTableView.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/11/30.
//

import UIKit

class SearchTableCell : UITableViewCell{
    static let identifier = "SearchTableViewCell"
    
    let personName = UILabel().then {
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
    }
    let divider = UIView().then{
        $0.backgroundColor = .EZY_DEDEDE
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addContentView()
        autoLayout()
    }
    
    private func addContentView() {
        contentView.addSubview(personName)
        contentView.addSubview(divider)
    }
    
    private func autoLayout() {
        personName.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(contentView.snp.left).offset(contentView.frame.height/2.643)
        }
        divider.snp.makeConstraints {
            $0.bottom.equalTo(snp.bottom)
            $0.height.equalTo(contentView.frame.height/74)
            $0.right.equalToSuperview().inset(frame.height/2.643)
            $0.left.equalToSuperview().offset(frame.height/2.643)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


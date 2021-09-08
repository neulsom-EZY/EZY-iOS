//
//  TagAddModalView.swift
//  EZY
//
//  Created by 김유진 on 2021/06/20.
//

import UIKit

class TagAddModalView: UIView {
    lazy var shadowBackgroundView = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }

    lazy var modalBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "태그 추가"
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = UIColor(red: 154/255, green: 174/255, blue: 253/255, alpha: 1)
    }
    
    lazy var tagNameLabel = UILabel().then {
        $0.text = "태그 이름"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
    }
    
    lazy var tagNameBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        $0.layer.cornerRadius = 10
    }
    
    lazy var tagNameTextField = UITextField().then {
        $0.placeholder = "태그 이름을 입력하세요."
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Bold")
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
    }
    
    lazy var tagColorLabel = UILabel().then {
        $0.text = "태그 색"
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-Thin")
        $0.textColor = UIColor(red: 129/255, green: 129/255, blue: 129/255, alpha: 1)
    }
    
    lazy var tagAddButton = UIButton().then {
        $0.setTitle("완 료", for: .normal)
        $0.backgroundColor = UIColor(red: 154/255, green: 174/255, blue: 253/255, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.setTitleColor(UIColor.white, for: .normal)
    }
    
    lazy var writeTagNameView = UIButton().then{
        $0.backgroundColor = .white
        $0.setTitle("태그 이름을 입력해주세요!", for: .normal)
        $0.layer.cornerRadius = 10
        $0.setTitleColor(UIColor(red: 147/255, green: 147/255, blue: 147/255, alpha: 1), for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Medium")
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowRadius = 6
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
        $0.layer.shadowColor = UIColor.darkGray.cgColor
    }
}

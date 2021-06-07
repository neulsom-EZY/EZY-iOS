//
//  GroupManagementCollectionViewCell.swift
//  EZY
//
//  Created by 김유진 on 2021/06/07.
//

import UIKit

class GroupCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properties
    static var GroupCollectionViewCellIdentifier = "\(GroupCollectionViewCell.self)"
    
    lazy var cellBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = false
        $0.layer.shadowOpacity = 0.9
        $0.layer.shadowRadius = 7
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowColor = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor
    }
    
    lazy var titleBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 255/255, green: 205/255, blue: 184/255, alpha: 1)
        $0.layer.cornerRadius = 17
        $0.clipsToBounds = true
        
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "영어 스터디"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var userNameGroup = UILabel().then {
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.text = "youjin\nyoujin\nyoujin\nyoujin\nyoujin\nyoujin\nvyoujin\n"
    }
    
    lazy var star = UIImageView().then {
        $0.image? = UIImage(named: "")!
    }
    
    //MARK: LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
       
        configureUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureUI()
    }
    
    func configureUI(){
        
        contentView.addSubview(cellBackgroundView)
        contentView.addSubview(titleBackgroundView)
        titleBackgroundView.addSubview(titleLabel)
        cellBackgroundView.addSubview(star)
        cellBackgroundView.addSubview(userNameGroup)
        
        titleBackgroundView.snp.makeConstraints { make in
            make.bottom.equalTo(cellBackgroundView.snp.top).offset(14)
            make.centerX.equalToSuperview()
            make.width.equalTo(cellBackgroundView).dividedBy(1.5)
            make.height.equalTo(cellBackgroundView).dividedBy(4)
        }
        
        cellBackgroundView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(contentView.frame.height/7)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview()
            
        }
        
        userNameGroup.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        star.snp.makeConstraints { make in
            
        }
    }
    


}

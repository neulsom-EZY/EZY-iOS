//
//  RescheduleViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/06/19.
//

import UIKit

class RescheduleViewController: UIViewController {
    
    lazy var topView = TopView()
    
    lazy var calendarView = WhiteBackgroundView()
    
    lazy var timeView = WhiteBackgroundView()
    
    lazy var locationView = WhiteBackgroundView()
    
    lazy var titleBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 244/255, green: 246/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    
    lazy var titleLabel = UILabel().then {
        $0.text = "제목"
        $0.textColor = UIColor(red: 128/255, green: 153/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var titleTextField = UITextField().then {
        $0.text = "강아지 산책 시키기"
        $0.textAlignment = .left
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    lazy var calendarLabel = UILabel().then {
        $0.text = "2021. 05. 09 화요일"
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 16, currentFontName: "Poppins-Regular")
    }
    
    lazy var timeLabel = UILabel().then {
        $0.text = "11:00AM - 1:00PM"
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 16, currentFontName: "Poppins-Regular")
    }
    
    lazy var locationLabel = UILabel().then {
        $0.text = "송정역 이디야 카페"
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 16, currentFontName: "Poppins-Regular")
    }
    
    lazy var explanationBackgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 246/255, green: 243/255, blue: 255/255, alpha: 1)
        $0.layer.cornerRadius = 20
    }
    
    lazy var explanationTitleLabel = UILabel().then {
        $0.text = "설명"
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var explanationTextView = UITextView().then {
        $0.text = "카페에서 디자인 이론 공부 하기, 카페에서 디자인 이론 공부 하기"
        $0.textAlignment = .left
        $0.backgroundColor = .clear
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Medium")
    }
    
    lazy var tagLabel = UILabel().then {
        $0.text = "태그"
        $0.textColor = UIColor(red: 182/255, green: 182/255, blue: 182/255, alpha: 1)
        $0.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var tagStudyButton = UIButton().then {
        $0.setTitle("공부", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }
    
    lazy var tagWalkButton = UIButton().then {
        $0.setTitle("산책", for: .normal)
        $0.setTitleColor(UIColor(red: 186/255, green: 222/255, blue: 255/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 186/255, green: 222/255, blue: 255/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var tagMajorBandButton = UIButton().then {
        $0.setTitle("전공동아리", for: .normal)
        $0.setTitleColor(UIColor(red: 207/255, green: 227/255, blue: 206/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 207/255, green: 227/255, blue: 206/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var tagFreedomBandButton = UIButton().then {
        $0.setTitle("자율동아리", for: .normal)
        $0.setTitleColor(UIColor(red: 228/255, green: 201/255, blue: 255/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 228/255, green: 201/255, blue: 255/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }
    
    lazy var tagAddButton = UIButton().then {
        $0.setTitle("+ 추가", for: .normal)
        $0.setTitleColor(UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 186/255, green: 200/255, blue: 255/255, alpha: 1).cgColor
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Bold")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
            
        topViewSetting()
        
        layoutSetting()
        
        calendarViewSetting()
        
        timeViewSetting()
        
        locationViewSetting()

        labelSetting()
    }
    
    func layoutSetting(){
        self.view.addSubview(titleBackgroundView)
        titleBackgroundView.addSubview(titleLabel)
        titleBackgroundView.addSubview(titleTextField)
        self.view.addSubview(calendarLabel)
        self.view.addSubview(timeLabel)
        self.view.addSubview(locationLabel)
        self.view.addSubview(tagLabel)
        self.view.addSubview(tagStudyButton)
        self.view.addSubview(tagWalkButton)
        self.view.addSubview(tagMajorBandButton)
        self.view.addSubview(tagFreedomBandButton)
        self.view.addSubview(tagAddButton)
        
        self.view.addSubview(explanationBackgroundView)
        explanationBackgroundView.addSubview(explanationTitleLabel)
        explanationBackgroundView.addSubview(explanationTextView)
        
        titleBackgroundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/13.3)
            make.height.equalToSuperview().dividedBy(12)
            make.top.equalTo(topView.snp.bottom).offset(self.view.frame.height/19.8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/17.8)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(titleLabel.snp.right).offset(self.view.frame.width/17.8)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview()
        }
        
        explanationTitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(self.view.frame.width/17.8)
        }
        
        explanationTextView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(explanationTitleLabel.snp.right).offset(self.view.frame.width/17.8)
            make.width.equalToSuperview().dividedBy(1.45)
            make.height.equalToSuperview().dividedBy(1.3)
        }

    }

    
    func calendarViewSetting(){
        self.view.addSubview(calendarView)
        calendarView.addSubview(calendarView.backgroundView)
        calendarView.backgroundView.addSubview(calendarView.iconImageView)
        
        calendarView.dataSetting(iconImage: UIImage(named: "EZY_Calendar.svg")!)
        
        calendarView.snp.makeConstraints { make in
            make.top.equalTo(titleBackgroundView.snp.bottom).offset(self.view.frame.height/30)
            make.height.equalToSuperview().dividedBy(16)
            make.width.equalTo(calendarView.snp.height)
            make.left.equalTo(titleBackgroundView)
        }
        
        calendarView.backgroundView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        calendarView.iconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.4)
        }
    }
    
    
    func timeViewSetting(){
        self.view.addSubview(timeView)
        timeView.addSubview(timeView.backgroundView)
        timeView.backgroundView.addSubview(timeView.iconImageView)
        
        timeView.dataSetting(iconImage: UIImage(named: "EZY_TimeSquare.svg")!)
        
        timeView.snp.makeConstraints { make in
            make.top.equalTo(calendarView.snp.bottom).offset(self.view.frame.height/47.7)
            make.height.equalToSuperview().dividedBy(16)
            make.width.equalTo(timeView.snp.height)
            make.left.equalTo(calendarView)
        }
        
        timeView.backgroundView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        timeView.iconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2.4)
        }
    }
    
    func locationViewSetting(){
        self.view.addSubview(locationView)
        locationView.addSubview(locationView.backgroundView)
        locationView.backgroundView.addSubview(locationView.iconImageView)
        
        locationView.dataSetting(iconImage: UIImage(named: "EZY_Location.svg")!)
        
        locationView.snp.makeConstraints { make in
            make.top.equalTo(timeView.snp.bottom).offset(self.view.frame.height/47.7)
            make.height.equalToSuperview().dividedBy(16)
            make.width.equalTo(timeView.snp.height)
            make.left.equalTo(timeView)
        }
        
        locationView.backgroundView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        locationView.iconImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalToSuperview().dividedBy(2)
        }
        
        explanationBackgroundView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo(titleBackgroundView)
            make.height.equalToSuperview().dividedBy(12)
            make.top.equalTo(locationView.snp.bottom).offset(self.view.frame.height/30)
        }
        
        tagLabel.snp.makeConstraints { make in
            make.left.equalTo(titleBackgroundView)
            make.top.equalTo(explanationBackgroundView.snp.bottom).offset(self.view.frame.height/38.6)
        }
        
        tagStudyButton.snp.makeConstraints{ make in
            make.top.equalTo(tagLabel.snp.bottom).offset(self.view.frame.height/47.7)
            make.left.equalTo(tagLabel)
            make.height.equalToSuperview().dividedBy(25.3)
            make.width.equalToSuperview().dividedBy(4.4)
            
            tagStudyButton.layer.cornerRadius = (self.view.frame.height/25.3)/2
        }
        
        tagWalkButton.snp.makeConstraints { make in
            make.top.equalTo(tagStudyButton)
            make.left.equalTo(tagStudyButton.snp.right).offset(self.view.frame.width/25)
            make.height.width.equalTo(tagStudyButton)
            
            tagWalkButton.layer.cornerRadius = (self.view.frame.height/25.3)/2
        }
        
        tagMajorBandButton.snp.makeConstraints { make in
            make.top.equalTo(tagWalkButton)
            make.left.equalTo(tagWalkButton.snp.right).offset(self.view.frame.width/25)
            make.height.width.equalTo(tagStudyButton)
            
            tagMajorBandButton.layer.cornerRadius = (self.view.frame.height/25.3)/2
        }
        
        tagFreedomBandButton.snp.makeConstraints { make in
            make.top.equalTo(tagStudyButton.snp.bottom).offset(self.view.frame.height/60)
            make.left.equalTo(tagStudyButton.snp.left)
            make.height.width.equalTo(tagStudyButton)
            
            tagFreedomBandButton.layer.cornerRadius = (self.view.frame.height/25.3)/2
        }
        
        tagAddButton.snp.makeConstraints { make in
            make.top.equalTo(tagFreedomBandButton)
            make.left.equalTo(tagFreedomBandButton.snp.right).offset(self.view.frame.width/25)
            make.height.width.equalTo(tagStudyButton)
            
            tagAddButton.layer.cornerRadius = (self.view.frame.height/25.3)/2
        }
    }
    
    
    func topViewSetting() {
        self.view.addSubview(topView)
        topView.addSubview(topView.backButton)
        topView.addSubview(topView.titleLabel)
        
        topView.topViewDataSetting(backButtonImage: UIImage(named: "EZY_SettingBackButton")!, titleLabelText: "나의 할 일 변경",
                                   textColor: UIColor(red: 154/255, green: 174/255, blue: 253/255, alpha: 1))

        topView.topViewLayoutSetting(screenHeight: Double(self.view.bounds.height), screenWeight: Double(self.view.bounds.width))
        
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalToSuperview().dividedBy(8)
        }
    }
    
    func labelSetting(){
        calendarLabel.snp.makeConstraints { make in
            make.centerY.equalTo(calendarView)
            make.left.equalTo(calendarView.snp.right).offset(self.view.frame.width/13.8)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(timeView)
            make.left.equalTo(timeView.snp.right).offset(self.view.frame.width/13.8)

        }
        
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationView)
            make.left.equalTo(locationView.snp.right).offset(self.view.frame.width/13.8)

        }
    }
}

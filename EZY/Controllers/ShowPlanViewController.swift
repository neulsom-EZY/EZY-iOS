//
//  ShowScheduleViewController.swift
//  EZY
//
//  Created by 김유진 on 2021/05/30.
//

import UIKit
import SnapKit
import Then




class ShowPlanViewController: UIViewController{

    //MARK: Properties
    let planCompleteModalView = PlanCompleteModalView()
        
    var groupNameArray: [String] = ["EZY 회의", "디자인 이론 공부", "강아지 산책시키기", "카페에서 마카롱 사오기", "EZY 회의", "디자인 이론 공부", "강아지 산책시키기", "카페에서 마카롱 사오기"]
    var planTitleTextArray: [String] = ["EZY 회의", "디자인 이론 공부", "강아지 산책시키기", "카페에서 마카롱 사오기", "EZY 회의댜댵", "디자인 이론 공부", "강아지 산책시키기", "카페에서 마카롱 사오기"]
    var planTimeArray: [String] = ["12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00", "12:00 - 13:00"]
    
    let scheduleTypesArray = ["나의 할 일","심부름","문의하기", "설정"]
    let icon = [UIImage(named: "EZY_OnePersonImage"), UIImage(named: "EZY_Errand"), UIImage(named: "EZY_InquiryImage"), UIImage(named: "EZY_settingsIcon")]
    
    lazy var userName = "Y00ujin"
    
    var selectedIndex = 0
    
    var purpleColor: UIColor! = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    var orangeColor: UIColor! = UIColor(red: 255/255, green: 166/255, blue: 128/255, alpha: 1)
    var yellowColor: UIColor! = UIColor(red: 255/255, green: 209/255, blue: 141/255, alpha: 1)
    var greenColor: UIColor! = UIColor(red: 184/255, green: 128/255, blue: 255/255, alpha: 1)
    
    lazy var EZYPlanBackgroundColor: [UIColor] = [purpleColor, orangeColor, yellowColor, greenColor, purpleColor, orangeColor, yellowColor, greenColor]
    
    let questionTopLabelColorArray = [UIColor(red: 165/255, green: 139/255, blue: 254/255, alpha: 1), UIColor(red: 114/255, green: 111/255, blue: 254/255, alpha: 1)]
    
    let questionMiddleLabelColorArray = [UIColor(red: 114/255, green: 111/255, blue: 255/255, alpha: 1), UIColor(red: 140/255, green: 139/255, blue: 255/255, alpha: 1)]
    
    let questionBottomLabelColorArray = [UIColor(red: 140/255, green: 139/255, blue: 255/255, alpha: 1), UIColor(red: 218/255, green: 225/255, blue: 255/255, alpha: 1)]
    
    lazy var badgeView = UIView().then {
        $0.backgroundColor = UIColor(red: 107/255, green: 64/255, blue: 255/255, alpha: 1)
        $0.isHidden = true
    }
    
    lazy var notificationButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_Notification"), for: .normal)
    }

    lazy var questionTopLabel = UILabel().then {
        $0.text = "\(userName)님,"
        $0.textAlignment = .left
        $0.dynamicFont(fontSize: 28, currentFontName: "AppleSDGothicNeo-Bold")
        $0.updateGradientTextColor_vertical(gradientColors: questionTopLabelColorArray)
    }
    
    lazy var questionMiddleLabel = UILabel().then{
        $0.text = "오늘은 어떤 하루를"
        $0.textAlignment = .left
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-Bold")
        $0.updateGradientTextColor_vertical(gradientColors: questionMiddleLabelColorArray)

    }
    
    lazy var questionBottomLabel = UILabel().then{
        $0.text = "보내실 건가요?"
        $0.textAlignment = .left
        $0.dynamicFont(fontSize: 22, currentFontName: "AppleSDGothicNeo-Bold")
        $0.updateGradientTextColor_vertical(gradientColors: questionBottomLabelColorArray)
    }
    
    lazy var EZYLISTTitleLabel = UILabel().then {
        $0.textColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
        $0.text = "EZYLIST"
        $0.dynamicFont(fontSize: 12, currentFontName: "Poppins-Bold")
    }
    
    var EZYPlanAddButton = UIButton().then {
        $0.setImage(UIImage(named: "EZY_PlanAddButton"), for: .normal)
    }
    

    lazy var emptyPlanBoxView = UIView().then{
        $0.backgroundColor = .white
    }
    
    lazy var emptyLabel = UITextView().then{
        $0.isScrollEnabled = false
        $0.isEditable = false
        $0.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        $0.text = "아직 계획이 없네요 !\n가치있는 하루를 위해 계획을 세워보세요"
        $0.textAlignment = .center
        $0.dynamicFont(fontSize: 12, currentFontName: "AppleSDGothicNeo-Thin")
    }
    
    lazy var emptyImageView = UIImageView().then{
        $0.image = UIImage(named: "EZY_EmptyImage")
    }
    
    let scheduleTimeTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
    }
    
    let scheduleTypeCollectionMainView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.backgroundColor = .white
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 17, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
    }
    
    let bgView = UIView().then {
        $0.backgroundColor = .black
    }
    
    //MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        topLayoutSetting()

        ScheduleTypeCollectionMainViewSetting()
        
        middleLayoutSetting()
        
        ScheduleTimeTableMainViewSetting()

        planCompleteModalViewSetting()

        emptyPlanBoxViewSetting()
    }
    
    @objc func EZYPlanAddButtonClicked(sender:UIButton){
        let MoreCalendarModalsVC = MoreCalendarModalsViewController.instance()
        
        MoreCalendarModalsVC.delegate = self
        addDim()
        present(MoreCalendarModalsVC, animated: true, completion: nil)
    }
    
    private func addDim() {
           view.addSubview(bgView)
           bgView.snp.makeConstraints { (make) in
               make.edges.equalTo(0)
           }
           
           DispatchQueue.main.async { [weak self] in
               self?.bgView.alpha = 0.2
           }
       }
       
    private func removeDim() {
        DispatchQueue.main.async { [weak self] in
            self?.bgView.removeFromSuperview()
            self?.dismiss(animated: true)
        }
    }
    private func updateDim(viewcontroller : UIViewController){
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.pushViewController(viewcontroller ?? UIViewController(), animated: true)
        }
    }
    
    
    // MARK: - layoutSetting
    func topLayoutSetting(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(questionTopLabel)
        self.view.addSubview(questionMiddleLabel)
        self.view.addSubview(questionBottomLabel)
        self.view.addSubview(notificationButton)
        self.notificationButton.addSubview(badgeView)
        
        EZYPlanAddButton.addTarget(self, action: #selector(EZYPlanAddButtonClicked(sender:)), for: .touchUpInside)
        notificationButton.addTarget(self, action: #selector(NotificationButtonClicked), for: .touchUpInside)
        
        questionTopLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/12.9)
            make.top.equalToSuperview().offset(self.view.frame.height/12)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        questionMiddleLabel.snp.makeConstraints { make in
            make.top.equalTo(questionTopLabel.snp.bottom)
            make.left.equalTo(questionTopLabel)
        }

        questionBottomLabel.snp.makeConstraints { make in
            make.top.equalTo(questionMiddleLabel.snp.bottom)
            make.left.equalTo(questionMiddleLabel)
        }
        
        badgeView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.right.equalToSuperview().offset(-3)
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(badgeView.snp.width)
        }
        
        badgeView.layer.cornerRadius = view.frame.height/54.1/4

        notificationButton.snp.makeConstraints { make in
            make.top.equalTo(questionTopLabel)
            make.right.equalToSuperview().offset(-26.8)
            make.width.equalToSuperview().dividedBy(31.2/2)
            make.height.equalToSuperview().dividedBy(54.1/2)
        }
        
        let attributedString = NSMutableAttributedString(string: EZYLISTTitleLabel.text!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(3.0), range: NSRange(location: 0, length: attributedString.length))
        EZYLISTTitleLabel.attributedText = attributedString

    }
    
    func middleLayoutSetting(){
        self.view.addSubview(EZYLISTTitleLabel)
        self.view.addSubview(EZYPlanAddButton)
        
        EZYLISTTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(29)
            make.top.equalTo(scheduleTypeCollectionMainView.snp.bottom).offset(9)
        }

        EZYPlanAddButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(29)
            make.top.equalTo(scheduleTypeCollectionMainView.snp.bottom).offset(9)
        }
    }
    
    func emptyPlanBoxViewSetting(){
        self.view.addSubview(emptyPlanBoxView)
        emptyPlanBoxView.addSubview(emptyLabel)
        emptyPlanBoxView.addSubview(emptyImageView)
        
        emptyPlanBoxView.snp.makeConstraints { make in
            make.top.equalTo(EZYLISTTitleLabel.snp.bottom).offset(self.view.frame.height/12.11)
            make.bottom.equalToSuperview().offset(self.view.frame.height/12.11)
            make.left.right.equalToSuperview()
        }
        
        emptyImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
            make.width.equalToSuperview().dividedBy(1.4)
        }
        
        emptyLabel.snp.makeConstraints { make in
            make.top.equalTo(emptyImageView.snp.bottom).offset(self.view.frame.height/33.8)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func NotificationButtonClicked(sender: UIButton) {
        let pushVC = NotificationViewController()
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    @objc func completeOkButtonClicked(sender: UIButton) {
        groupNameArray.remove(at: selectedIndex)
        planTitleTextArray.remove(at: selectedIndex)
        planTimeArray.remove(at: selectedIndex)
        EZYPlanBackgroundColor.remove(at: selectedIndex)
        
        scheduleTimeTableView.reloadData()
        
        planCompleteModalView.isHidden = true
    }
    
    @objc func completeCancelButtonClicked(sender: UIButton){
        planCompleteModalView.isHidden = true
    }
    
    func ScheduleTypeCollectionMainViewSetting(){
        
        self.view.addSubview(scheduleTypeCollectionMainView)
        
        scheduleTypeCollectionMainView.delegate = self
        scheduleTypeCollectionMainView.dataSource = self
        
        scheduleTypeCollectionMainView.snp.makeConstraints { make in
            make.top.equalTo(questionBottomLabel.snp.bottom)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(4)
        }
        
        scheduleTypeCollectionMainView.register(ScheduleTypeCollectionViewCell.self, forCellWithReuseIdentifier: ScheduleTypeCollectionViewCell.ScheduleTypeCollectionViewIdentifier)
        scheduleTypeCollectionMainView.backgroundColor = .clear
    }
    
    func ScheduleTimeTableMainViewSetting(){
        self.view.addSubview(scheduleTimeTableView)
                
        scheduleTimeTableView.dataSource = self
        scheduleTimeTableView.delegate = self
        
        scheduleTimeTableView.snp.makeConstraints { make in
            make.top.equalTo(EZYLISTTitleLabel.snp.bottom).offset(self.view.frame.height/36)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        scheduleTimeTableView.register(ScheduleTimeTableViewCell.self, forCellReuseIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier)
        
    }
    
    func planCompleteModalViewSetting(){
        self.view.addSubview(planCompleteModalView)
        
        planCompleteModalView.okButton.addTarget(self, action: #selector(completeOkButtonClicked(sender:)), for: .touchUpInside)
        planCompleteModalView.cancelButton.addTarget(self, action: #selector(completeCancelButtonClicked(sender:)), for: .touchUpInside)
        
        planCompleteModalView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        planCompleteModalView.shadowBackgroundView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalToSuperview()
        }
        
        planCompleteModalView.cancelButton.snp.makeConstraints { make in
            make.bottom.equalTo(planCompleteModalView.okButton)
            make.right.equalTo(planCompleteModalView.okButton.snp.left).offset(-self.view.frame.width/35)
            make.height.width.equalTo(planCompleteModalView.okButton)
        }
        
        planCompleteModalView.okButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-self.view.frame.width/22)
            make.right.equalToSuperview().offset(-self.view.frame.width/18)
            make.height.equalToSuperview().dividedBy(3.9)
            make.width.equalToSuperview().dividedBy(4.44)
        }
        
        planCompleteModalView.isHidden = true
        
        self.view.backgroundColor = .white
    }
}

extension ShowPlanViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.view.frame.width / 3.45, height: (self.view.frame.width / 3)/0.95)
    }
    
    //MARK: collectionView - left Padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: self.view.frame.width/11)
    }
    
    //MARK: collectionView - cell 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 22
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 2{
            let nextViewController = InquiryViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        if indexPath.row == 3{
            let nextViewController = SettingViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)

        }
    }
}

extension ShowPlanViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scheduleTypesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                ScheduleTypeCollectionViewCell.ScheduleTypeCollectionViewIdentifier, for: indexPath) as? ScheduleTypeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        
        cell.label.text = scheduleTypesArray[indexPath.row]
        cell.icon.image = icon[indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
}

extension ShowPlanViewController: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if groupNameArray.count == 0{
            tableView.isHidden = true
            emptyPlanBoxView.isHidden = false
            return groupNameArray.count
        }else{
            emptyPlanBoxView.isHidden = true
            tableView.isHidden = false
            return groupNameArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTimeTableViewCell.ScheduleTimeTableViewIdentifier, for: indexPath) as! ScheduleTimeTableViewCell
        
        cell.groupNameLabel.text = groupNameArray[indexPath.row]
        cell.titleLabel.text = planTitleTextArray[indexPath.row]
        cell.planTimeLabel.text = planTimeArray[indexPath.row]

        cell.EZYLISTCellLeftDecorationView.backgroundColor = EZYPlanBackgroundColor[indexPath.row]
        cell.titleLabel.textColor = EZYPlanBackgroundColor[indexPath.row]
        cell.groupNameLabel.textColor = EZYPlanBackgroundColor[indexPath.row]
                
        cell.backgroundColor = .clear
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/8
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 0
    }

}

extension ShowPlanViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 일정 이름 길이에 따른 모달의 layout 변경
        if planTitleTextArray[indexPath.row].count <= 10{
            planCompleteModalView.modalBackgroundView.snp.remakeConstraints { make in
                make.width.equalToSuperview().dividedBy(1.1)
                make.height.equalToSuperview().dividedBy(6.29)
                make.centerX.centerY.equalToSuperview()
            }
                                    
            planCompleteModalView.labelView.snp.remakeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalTo((planTitleTextArray[indexPath.row] as NSString).size(withAttributes: [NSAttributedString.Key.font : planCompleteModalView.planTitleNameLabel.font!]).width + (planCompleteModalView.completeQuestionsLabel.text! as NSString).size(withAttributes: [NSAttributedString.Key.font : planCompleteModalView.completeQuestionsLabel.font!]).width + self.view.frame.width/70)
                make.height.equalToSuperview().dividedBy(10)
                make.top.equalToSuperview().offset(self.view.frame.height/21)
            }
            
            planCompleteModalView.planTitleNameLabel.snp.remakeConstraints { make in
                make.left.centerY.equalToSuperview()
            }
            
            planCompleteModalView.completeQuestionsLabel.snp.remakeConstraints { make in
                make.right.centerY.equalToSuperview()
            }
        }else{
            planCompleteModalView.modalBackgroundView.snp.remakeConstraints { make in
                make.width.equalToSuperview().dividedBy(1.1)
                make.height.equalToSuperview().dividedBy(5.75)
                make.centerX.centerY.equalToSuperview()
            }
            
            planCompleteModalView.labelView.snp.remakeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalToSuperview()
                make.height.equalToSuperview().dividedBy(3.8)
                make.top.equalToSuperview().offset(self.view.frame.height/21)
            }
            
            planCompleteModalView.planTitleNameLabel.snp.remakeConstraints { make in
                make.top.centerX.equalToSuperview()
            }
            
            planCompleteModalView.completeQuestionsLabel.snp.remakeConstraints { make in
                make.bottom.centerX.equalToSuperview()
            }
        }
    
        planCompleteModalView.planTitleNameLabel.text = planTitleTextArray[indexPath.row]
        
        selectedIndex = indexPath.row
        
        planCompleteModalView.isHidden = false
        
    }
}

extension ShowPlanViewController: BulletinDelegate {
    func update(vc: UIViewController) {
        self.removeDim()
        self.updateDim(viewcontroller: vc)
    }
    
    func onTapClose() {
        self.removeDim()
    }
 
}

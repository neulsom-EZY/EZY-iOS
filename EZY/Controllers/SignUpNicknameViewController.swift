//
//  SignUpNicknameViewController.swift
//  EZY
//
//  Created by 노연주 on 2021/06/12.
//

import UIKit
import SnapKit
import Then

class SignUpNicknameViewController: UIViewController{
    //MARK: - Properties
    
    let topBarView = TopBarView().then {
        $0.goBackButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    lazy var putNicknameLabel = UILabel().then {
        $0.text = "닉네임을\n입력해주세요."
        $0.numberOfLines = 2
        $0.dynamicFont(fontSize: 25, currentFontName: "AppleSDGothicNeo-SemiBold")
        $0.textColor = UIColor.EZY_968DFF
    }
    
    lazy var nicknameContainerView: UIView = {
        let view = Utilities().inputContainerView(textField: nicknameField, text: "닉네임", fonts: 14)
        return view
    }()
    
    lazy var nicknameField:UITextField = {
        let tf = Utilities().textField(withPlaceholder: "")
        return tf
    }()
    
    lazy var alreadyExistLabel = UILabel().then {
        $0.text = "이미 존재하는 닉네임입니다!"
        $0.textColor = UIColor.EZY_FCA1A1
        $0.dynamicFont(fontSize: 10, currentFontName: "AppleSDGothicNeo-SemiBold")
    }
    
    lazy var continueButton = CustomGradientContinueBtnView().then {
        $0.titleLabel?.dynamicFont(fontSize: 14, currentFontName: "AppleSDGothicNeo-Bold")
        $0.addTarget(self, action: #selector(onTapContinuePassword), for: .touchUpInside)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc
    func goBack(){
        navigationController?.popViewController(animated: true )
    }
    
    @objc
    func onTapContinuePassword(){
        let controller = SignUpPasswordViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        addView()
        topBarViewSetting()
        cornerRadius()
        location()
        
        alreadyExistLabel.isHidden = true
    }
    
    func addView(){
        view.addSubview(topBarView)
        view.addSubview(putNicknameLabel)
        view.addSubview(nicknameContainerView)
        view.addSubview(alreadyExistLabel)
        view.addSubview(continueButton)
    }
    
    func cornerRadius(){
        continueButton.layer.cornerRadius = self.view.frame.height/81.2
    }
    
    func location(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        topBarView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(self.view.frame.height/7.19)
        }
        
        putNicknameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.view.frame.height/5.04)
            make.left.equalTo(nicknameContainerView)
        }
        
        nicknameContainerView.snp.makeConstraints { make in
            make.top.equalTo(putNicknameLabel).offset(self.view.frame.height/8.29)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.34)
            make.height.equalTo(self.view.frame.height/15.62)
        }
        
        alreadyExistLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameContainerView).offset(self.view.frame.height/13.76)
            make.left.equalTo(nicknameContainerView)
        }
        
        continueButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(self.view.frame.height/32.48 * -1)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.view.frame.width/1.13)
            make.height.equalTo(self.view.frame.height/16.24)
        }
    }
    
    func topBarViewSetting(){
        topBarView.addSubview(topBarView.goBackButton)
        topBarView.addSubview(topBarView.EZY_Logo)
        
        topBarView.topBarViewLayoutSetting(screenHeight: self.view.frame.height, screenWidth: self.view.frame.width)
    }
    
    @objc
    func keyboardWillShow(_ sender: Notification) {
        var keyboardHeight: CGFloat = CGFloat(0)
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
        }
        continueButton.frame.origin.y -= keyboardHeight
    }

    @objc
    func keyboardWillHide(_ sender: Notification) {
        continueButton.frame.origin.y = self.view.frame.height - continueButton.frame.height - self.view.frame.height/32.48
    }
}


//MARK: - Preview
#if DEBUG
import SwiftUI
struct SignUpNicknameViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        SignUpNicknameViewController()
    }
}
@available(iOS 13.0, *)
struct SignUpNicknameViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpNicknameViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif



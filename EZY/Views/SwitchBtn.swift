//
//  SwitchBtn.swift
//  EZY
//
//  Created by Ji-hoon Ahn on 2021/07/01.
//

import UIKit
import SnapKit
import Then

class SwitchBtn : UIButton{
    
    let backview = UIView().then{
        $0.backgroundColor = .EZY_AFADFF
    }
    let titleBtnView  = UIView().then{
        $0.backgroundColor = .white
    }
    var switchState : Bool? = true
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    func configureUI(){
        addSubview(backview)
        backview.addSubview(titleBtnView)
        backview.isUserInteractionEnabled = false
        titleBtnView.isUserInteractionEnabled = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backview.isUserInteractionEnabled = false
        titleBtnView.isUserInteractionEnabled = false
        backview.layer.cornerRadius = frame.height/2
        titleBtnView.layer.cornerRadius = titleBtnView.frame.height/2
        animationstate()
        backview.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
 
    }

    func animationstate(){
        if switchState!
        {
            animateOn()


        }else{
            animateOff()
        }
        
        
    }

    func animateOn(){
        self.titleBtnView.snp.makeConstraints { (make) in
            make.right.equalTo(self.backview.snp.right).offset(self.frame.height/12.98 * -1 )
            make.height.equalTo(self.frame.height/1.18)
            make.centerY.equalTo(self.backview.snp.centerY)
            make.width.equalTo(self.titleBtnView.snp.height)
        }
        UIView.animate(withDuration: 1, animations: {
            self.titleBtnView.layoutIfNeeded()
        })
    }
    func animateOff(){
        backview.backgroundColor = .EZY_CACACA
        self.titleBtnView.snp.makeConstraints { (make) in
            make.left.equalTo(self.backview.snp.left).offset(self.frame.height/12.98)
            make.height.equalTo(self.frame.height/1.18)
            make.centerY.equalTo(self.backview.snp.centerY)
            make.width.equalTo(self.titleBtnView.snp.height)
        }
        UIView.animate(withDuration: 1, animations: {
            self.titleBtnView.layoutIfNeeded()
        })
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

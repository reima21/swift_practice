//
//  ViewController.swift
//  rxswift_textfield
//
//  Created by 松平礼史 on 2019/04/26.
//  Copyright © 2019 松平礼史. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    let disposeBag = DisposeBag() //観測状態からの解放を行う際に使う
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.rx.text.orEmpty //受け取る値をStringに限定（空文字やnilはオブザーブしない）
            .map{$0.description} //受け取った値それぞれをString?からStringに変換する
            .bind(to: label.rx.text) //受け取った値を対象のUIViewのプロパティに反映させる
            .disposed(by: disposeBag) //観測対象から除外する

    }

}


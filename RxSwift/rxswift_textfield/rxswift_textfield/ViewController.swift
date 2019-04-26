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
    
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.rx.text.orEmpty
            .map{$0.description}
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)

    }


}


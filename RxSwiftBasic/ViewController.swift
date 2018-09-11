//
//  ViewController.swift
//  RxSwiftBasic
//
//  Created by GOQii-Ajeet on 11/09/18.
//  Copyright © 2018 GOQii-Ajeet. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeColorTap(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyboard.instantiateViewController(withIdentifier: "NewViewController") as! NewViewController
        let newColor = newVC.selectedColor
        
        newColor
            .subscribe(onNext: { [weak self] color in
                self?.view.backgroundColor = color
                }, onDisposed: {
                    print("disposed")
            })
        .disposed(by: bag)
        
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
}


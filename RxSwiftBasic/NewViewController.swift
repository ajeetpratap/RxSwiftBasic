//
//  NewViewController.swift
//  RxSwiftBasic
//
//  Created by GOQii-Ajeet on 11/09/18.
//  Copyright © 2018 GOQii-Ajeet. All rights reserved.
//

import UIKit
import RxSwift
class NewViewController: UIViewController {

    private let selectedColorSubject = PublishSubject<UIColor>()
    var selectedColor: Observable <UIColor> {
        return selectedColorSubject.asObservable()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        selectedColorSubject.onCompleted()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func redTap(_ sender: UIButton) {
        changeColor(color: UIColor.red)
    }
    
    @IBAction func greenTap(_ sender: UIButton) {
        changeColor(color: UIColor.green)
    }
    
    @IBAction func blueTap(_ sender: UIButton) {
        changeColor(color: UIColor.blue)
    }
    
    func changeColor(color: UIColor) {
        selectedColorSubject.onNext(color)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

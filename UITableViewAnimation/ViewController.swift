//
//  ViewController.swift
//  UITableViewAnimation
//
//  Created by 任岐鸣 on 2016/10/14.
//  Copyright © 2016年 Ned. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    @IBOutlet weak var tableView: AnimTableView!
    
    
    @IBAction func animFromBottomToTop(_ sender: UIButton) {
        tableView.reloadDataWithAnim(type: .fromBottomToTop)
    }
    @IBAction func animFromLeftToRight(_ sender: UIButton) {
        tableView.reloadDataWithAnim(type: .fromLeftToRight)
    }
    @IBAction func animFromRightToLeft(_ sender: UIButton) {
        tableView.reloadDataWithAnim(type: .fromRightToLeft)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.imageView?.image = UIImage.init(named: "test.jpg")
        cell.backgroundColor = randomColor()
        cell.textLabel?.text = "line:\(indexPath.row)"
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func randomColor(_ randomAlpha: Bool = false) -> UIColor {
        let randomRed = rnd()
        let randomGreen = rnd()
        let randomBlue = rnd()
        let alpha = randomAlpha ? rnd() : 1.0
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: alpha)
    }
    func rnd(_ lower: CGFloat = 0, _ upper: CGFloat = 1) -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (upper - lower) + lower
    }
}


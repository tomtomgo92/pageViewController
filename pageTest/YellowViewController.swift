//
//  YellowViewController.swift
//  pageTest
//
//  Created by mac on 10/05/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController
{

    @IBOutlet weak var yellowLbl: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        yellowLbl.text = "jqub=ne"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

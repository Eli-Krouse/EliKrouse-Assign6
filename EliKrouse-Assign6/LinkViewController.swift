//
//  LinkViewController.swift
//  EliKrouse-Assign6
//
//  Created by Krouse, William E. on 4/29/26.
//

import UIKit
import WebKit

class LinkViewController: UIViewController {

    
    @IBOutlet weak var appointmentButton: UIButton!
    
    @IBOutlet weak var WebMDButton: UIButton!
    
    @IBOutlet weak var nearestClinicButton: UIButton!
    
    
    var passableURL: String?
    
    @IBAction func webButtonTapped(_ sender: Any)
    {
        guard let button = sender as? UIButton else
        {
            return
        }
        
        switch(button.tag)
        {
            case 0:
                passableURL = "a"
            case 1:
                passableURL = "b"
            case 2:
                passableURL = "c"
            default:
                return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
        vc?.websiteURL = passableURL
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.tabBar.tintColor = .link
        tabBarController?.tabBar.unselectedItemTintColor = .gray
    }


}

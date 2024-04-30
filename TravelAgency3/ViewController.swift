//
//  ViewController.swift
//  TravelAgency3
//
// Created by Nelson, Camilo and Jose on 2024-04-28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonBook(){
        let book = storyboard?.instantiateViewController(withIdentifier: "BVC") as! BookViewController
        present(book, animated: true)
    }
}


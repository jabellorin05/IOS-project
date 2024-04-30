//
//  TestViewController.swift
//  TravelAgency3
//
//  Created by Nelson Penha on 2024-04-29.
//

import UIKit


class DestinationViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var labelCity: UILabel!
    
    // Usando ContentManager para acessar os dados
    let contents = ContentManager.shared.contents

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configurar a imagem inicial e o texto inicial
        if let firstContent = contents.first {
            imageView.image = firstContent.image
            textView.text = firstContent.description
            labelCity.text = firstContent.labelText
            textView.setContentOffset(CGPoint.zero, animated: false)
        }
        // Configurar o número de páginas
        pageControl.numberOfPages = contents.count
    }

    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
        let currentContent = contents[sender.currentPage]
        imageView.image = currentContent.image
        textView.text = currentContent.description
        labelCity.text = currentContent.labelText
        textView.setContentOffset(CGPoint.zero, animated: false)
    }
    @IBAction func returnMain(){
        let main = storyboard?.instantiateViewController(withIdentifier: "VC") as! ViewController
        present(main, animated: true)
    }
}



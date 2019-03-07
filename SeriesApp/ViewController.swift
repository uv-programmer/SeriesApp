//
//  ViewController.swift
//  SeriesApp
//
//  Created by Vishnu u on 05/03/19.
//  Copyright © 2019 Vishnu u. All rights reserved.
//

import UIKit
import FSPagerView
import Alamofire
import AlamofireImage
class ViewController: UIViewController, FSPagerViewDelegate,FSPagerViewDataSource {
    
    var seriesArray = [Series]()
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return seriesArray.count
        
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        pagerView.transformer = FSPagerViewTransformer(type: .ferrisWheel)
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.af_setImage(withURL: URL(string: String(describing: seriesArray[index].image!.original!))!, placeholderImage: UIImage(named: "test"))
            cell.textLabel?.text = String(describing: seriesArray[45].image!.original!)
        
        return cell
    }
    

    
    
    @IBOutlet weak var pagerView: FSPagerView!{
    didSet {
    self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}
//    func numberOfItems(in Fsview: FSPagerView) -> Int {
//        return 5
//    }
//
//
//    func pagerView(_ Fsview: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
//        let cell = Fsview.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
//        cell.imageView?.image = UIImage(named: "test" )
//        cell.imageView?.contentMode = .scaleAspectFill
//        cell.imageView?.clipsToBounds = true
//        return cell
//    }
//

    override func viewDidLoad() {
        super.viewDidLoad()
     
        let queryParams = ["q": "arrow"]
           let pageNumber = 1
        let params = ["page": pageNumber]
        // Do any additional setup after loading the view, typically from a nib.
        AlamofireApi.sharedInstance.getAllSeries(params: params) { (result) in
        self.seriesArray = result
            self.pagerView.reloadData()
        }
        AlamofireApi.sharedInstance.getOneSeries(withID: 1) { (series) in
            
        }
        
        AlamofireApi.sharedInstance.searchSeries(params: queryParams) { (result) in
            
        }
        
        
    }


}


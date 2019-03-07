//
//  Alamofire.swift
//  SeriesApp
//
//  Created by Vishnu u on 05/03/19.
//  Copyright © 2019 Vishnu u. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireApi {
    static let sharedInstance : AlamofireApi = {
        let instance = AlamofireApi()
        return instance
    }()
    
    
    
    
    //MARK:-  API Calls
    
    func getAllSeries(params : Parameters, callback: @escaping ( [Series]) -> Void )
    {
        Alamofire.request(APIdata.baseURL + APIdata.show, method: .get, parameters: params , encoding: URLEncoding.default  , headers: nil ).response { (response) in
            print(response.data!)
            do{
                let decoder = JSONDecoder()
                let seriesArray = try decoder.decode([Series].self, from: response.data!)
                print(seriesArray)
               callback(seriesArray)
            } catch let error {
                print(error)
            }
        }
        
        //        request(urldata.baseURL + urldata.show).responseJSON { response in
        
    }
    
    func getOneSeries(withID seriesID : Int, callback: @escaping (Series) -> Void ) {
        let seriesURL =  APIdata.baseURL + APIdata.show + "/" + String(seriesID)
        Alamofire.request(seriesURL, method: .get, parameters: nil , encoding: URLEncoding.default  , headers: nil ).response { (response) in
            print(response.data!)
            do{
                let decoder = JSONDecoder()
                let series = try decoder.decode(Series.self, from: response.data!)
                callback(series)
            } catch let error {
                print(error)
            }
    }
}
    
    func searchSeries(params: Parameters , callback: @escaping ([Series]) -> Void ){
        Alamofire.request(APIdata.baseURL + APIdata.show, method: .get, parameters: params , encoding: URLEncoding.default  , headers: nil ).response { (response) in
            print(response.data!)
            do{
                let decoder = JSONDecoder()
                let searchArray = try decoder.decode([Series].self, from: response.data!)
                callback(searchArray)
            } catch let error {
                print(error)
            }
        }
        
    }
//
//    func urlGenerator(){
//        var baseurl = urldata.base_url
//
//    }


}





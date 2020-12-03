//
//  HttpAndJSONVM.swift
//  SHSwiftUICode
//
//  Created by Seok Ho on 2020/12/02.
//

import Foundation
import SwiftyJSON
import Alamofire

class HttpAndJSONVM: ObservableObject {
   
    private static let TAG = "HttpAndJSONVM"
    
    @Published
    var httpAndJSONModel: HttpAndJSONModel = HttpAndJSONModel()
    
    @Published
    var showProgress = false
    
    func request() {
        
        showProgress = true
        
        ThreadUtil.startThread {
            // GET
            let url: String = "https://httpbin.org/get?name=seokho&nickname=sh"
            
            Alamofire.AF.request(url, method: .get).validate()
                .responseJSON {
                    (response) in

                    ILog.debug(tag: HttpAndJSONVM.TAG, content: response)
                    
                    ThreadUtil.startUIThread(runnable: {
                        
                        self.showProgress = false
                        self.parsing(response: response)
                        
                    }, afterSeconds: 0)
                }
        }
    }
    
    func parsing(response: AFDataResponse<Any>) {
        switch response.result {
            case .success(_):
                if let json = try? JSON(data: response.data!) {
                    let name = json["args"]["name"].string
                    let nickname = json["args"]["nickname"].string
                    
                    ILog.debug(tag: HttpAndJSONVM.TAG, content: "\(name ?? "") \(nickname ?? "")")
                    
                    // update view
                    httpAndJSONModel.name = name ?? ""
                    httpAndJSONModel.nickname = nickname ?? ""
                }
                break
            case .failure(_):
                ILog.debug(tag: HttpAndJSONVM.TAG, content: String(describing: response.error))
                break
        }
    }
}

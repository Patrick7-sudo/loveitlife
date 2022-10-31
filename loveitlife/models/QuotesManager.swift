import Foundation

protocol QuotesManagerDelegate {
    func didUpdateQuote(_ quotesManager2: QuotesManager2, quote: QuotesModel)
    func didFailWithError(error: Error)
}

struct QuotesManager2{

    var delegate: QuotesManagerDelegate?
    func fetchQuotes(){
           let quotes = "https://type.fit/api/quotes"
             self.performRequest(with: quotes)
    }

    func performRequest(with quotes: String) {
    //        1. create a url and take our url link and passed it as a string
            if let url = URL(string: quotes){

    //        2. create a URLSession
                let session = URLSession(configuration: .default)
    //        3. give the session a task
                
    //            /////////////////////////////////////////2//////////////////////////////////////////////
    //            inline function
                let task = session.dataTask(with: url) { (data, response, error) in
    //        if its an error we send this
                    if error != nil {
                        self.delegate?.didFailWithError(error: error!)
                        return
                    }
    //        if its correct data
                    if let safeData = data {
                        if let quoteIndividual = self.parseJSON(safeData){
                            
//                                let weatherVC = WelcomePageController()
//                                weatherVC.didUpdateQuote(quote: quoteIndividual)
                            
//                            delegate
                                self.delegate?.didUpdateQuote(self, quote: quoteIndividual)
                        }
                    }
                }
                
//            /////////////////////////////////////////end of 2//////////////////////////////////////////////
                task.resume()
            }
    }
        
            func parseJSON(_ quoteData: Data) -> QuotesModel? {
//          create a decoder
        
                let decoder = JSONDecoder()
        
//          decoding the data with type decodable..[.self is the decodable QuotesData]
                do{
                    let decodedData = try decoder.decode([QuotesData].self, from: quoteData)
        
                    let randomInt = Int.random(in: 1...10)
        
//          get the quote and put on the variable
                    let quoteText = decodedData[randomInt].text
//          passing the result of the data into a structure we made in QuotesModel
                    let quoteToDisplay = QuotesModel(quoteText: quoteText)
        
                    return quoteToDisplay
        
                } catch {
                    self.delegate?.didFailWithError(error: error)
                    return  nil
                }
        
            }
}


////
////  quotesManager.swift
////  loveitlife
////
////  Created by tasniim on 30/10/2022.
////
//
//import Foundation
//
//protocol QuotesManagerDelegate {
//    func didUpdateQuotes(_ QuotesManager: QuotesManager, quoteToDisplay: QuotesModel)
//
//}
//
//struct QuotesManager {
//
////    url to the quotes API
//    func fetchQuotes(){
//
//        let quotes = "https://type.fit/api/quotes"
//        performRequest(urlString: quotes)
////        print(quotes)
//    }
//
////    delegate
//    var delegate: QuotesManagerDelegate?



//    func performRequest(urlString: String) {
////        1. create a url and take our url link and passed it as a string
//        if let url = URL(string: urlString){
//
////        2. create a URLSession
//            let session = URLSession(configuration: .default)
////        3. give teh session a task
//            //passing what we want into the session so it can run async and give back the result after
//
////            there are 2 diiferent way of calling the function 1 is write inline function and 2 separate and call the function in
//
//
////            /////////////////////////////////////////1//////////////////////////////////////////////
////            let task = session.dataTask(with: url, completionHandler: handle( data: response: error: ))
////            /////////////////////////////////////////end of 1//////////////////////////////////////////////
//
//
////            /////////////////////////////////////////2//////////////////////////////////////////////
////            inline function
//            let task = session.dataTask(with: url) { (data, response, error) in
//                //        if its an error we send this
//                        if error != nil {
//                            print(error!)
//                            return
//                        }
//
//                //        if its correct data
//                        if let safeData = data {
//                //            encoding that is we read data
//                //            we need to convert the data to string but we going to parse it to object might be different output with function 1
////                            let dataString = String(data: safeData, encoding: .utf8)
////
////                            print(dataString)
////                            invoking our parsejSON function and sending it back to teh welcome controller
//                            if let quoteText = self.parseJSON(quoteData: safeData){
//                                self.delegate?.didUpdateQuotes(_QuotesManager: self, quoteToDisplay: quoteText)
//
//                            }
////                            print(safeData)
//                        }
//
//            }
//
////            /////////////////////////////////////////end of 2//////////////////////////////////////////////
////         4. Start the task
//            task.resume()
//        }
//    }
//
//
//
////            ///////////////////////////////////////// function outside 1//////////////////////////////////////////////
////    creating handle for function completion handler it will done data fetching from outside
////
////    func handle(data: Data?, response: URLResponse?, error: Error?){
//////        if its an error we send this
////        if error != nil {
////            print(error!)
////            return
////        }
////
//////        if its correct data
////        if let safeData = data {
//////            encoding that is we read data
//////            we need to convert the data to string
////            let dataString = String(data: safeData, encoding: .utf8)
////
////            print(dataString)
////        }
////    }
////            /////////////////////////////////////////end of function outside 1//////////////////////////////////////////////
//
////    parsing json
//
//    func parseJSON(quoteData: Data) -> QuotesModel? {
//        //create a decoder
//
//        let decoder = JSONDecoder()
//
////        decoding the data with type decodable..[.self is the decodable QuotesData]
//        do{
//            let decodedData = try decoder.decode([QuotesData].self, from: quoteData)
//
//            let randomInt = Int.random(in: 0...decodedData.count)
//
////            get the quote and put on the variable
//            let quoteText = decodedData[randomInt].text
//
//            let quoteToDisplay = QuotesModel(quoteText: quoteText)
////            print(decodedData[randomInt].text)
////            print(quoteToDisplay)
//
//            return quoteToDisplay
//
//        } catch {
//            print(error)
//            return  nil
//        }
//
//    }
//}

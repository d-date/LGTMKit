import Foundation

public struct LGTMKit {
    public static let postURL = URL(string: "https://lgtm.in/g")!

    public static func fetchImage(url: URL = LGTMKit.postURL, httpsImageOnly: Bool = false, completion: @escaping (URL) -> Void) {
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            do {
                guard let data = data else {
                    print(error?.localizedDescription ?? "")
                    return
                }
                let model = try JSONDecoder().decode(LGTM.self, from: data)

                guard let url = URL(string: model.actualImageUrl) else {
                    return
                }

                if httpsImageOnly, url.scheme != "https" {
                    self.fetchImage(url: LGTMKit.postURL, httpsImageOnly: true, completion: completion)
                    return
                }
                completion(url)
            } catch {
                print(error.localizedDescription)
                return
            }
        }
        task.resume()
    }

    public static func fetchImage(httpsImageOnly: Bool, completion: @escaping (URL) -> Void) {
        fetchImage(url: LGTMKit.postURL, httpsImageOnly: httpsImageOnly, completion: completion)
    }

    public static func asMarkdown(imageUrl: URL) -> String {
        return "<p align='center'><img src='\(imageUrl.absoluteString)' alt='LGTM' /></p>"
    }
}

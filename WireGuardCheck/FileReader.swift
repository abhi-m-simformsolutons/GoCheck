//
//  FileReader.swift
//  Layer
//
//  Created by Abhi Makadiya on 13/01/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd. All rights reserved.
//

import UIKit

class FileReader: NSObject {

    enum FileName {
        case queryLog
        case blackList
        case dnsCryptToml
        case nxLog
        case dnsLog
        case blockedLog
        case whiteListLog
        case socialDomainBlackList
        
        func value() -> URL? {
            switch self {
            case .queryLog:
                return FileReader().queryLogURL
            case .blackList:
                return FileReader().blackListURL
            case .dnsCryptToml:
                return FileReader().dnsCryptTomlURL
            case .nxLog:
                return FileReader().nxLogURL
            case .dnsLog:
                return FileReader().dnsLogURL
            case .blockedLog:
                return FileReader().blockedLogURL
            case .whiteListLog:
                return FileReader().whiteListLogURL
            case .socialDomainBlackList:
                return FileReader().socialDomainBlackListURL
            }
        }
    }
    
    // MARK: - Variables
    let containerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: Constants.appGroup)
    var queryLogURL: URL {
        return URL(fileURLWithPath: containerURL?.path ?? "").appendingPathComponent("dnscrypt/logs/query.log")
    }
    var blackListURL: URL {
        return URL(fileURLWithPath: containerURL?.path ?? "").appendingPathComponent("dnscrypt/blacklist.txt")
    }
    var dnsCryptTomlURL: URL {
        return URL(fileURLWithPath: containerURL?.path ?? "").appendingPathComponent("dnscrypt/dnscrypt.toml")
    }
    var nxLogURL: URL {
        return URL(fileURLWithPath: containerURL?.path ?? "").appendingPathComponent("dnscrypt/logs/nx.log")
    }
    var dnsLogURL: URL {
        return URL(fileURLWithPath: containerURL?.path ?? "").appendingPathComponent("dnscrypt/logs/dns.log")
    }
    var blockedLogURL: URL {
        return URL(fileURLWithPath: containerURL?.path ?? "").appendingPathComponent("dnscrypt/logs/blocked.log")
    }
    var whiteListLogURL: URL {
        return URL(fileURLWithPath: containerURL?.path ?? "").appendingPathComponent("dnscrypt/logs/whitelist.log")
    }
    var socialDomainBlackListURL: URL? {
        return Bundle.main.url(forResource: "SocialDomains", withExtension: "txt")
    }
    
    // MARK: - Initializer
    override init() {
        super.init()
    }
    
    // MARK: - Functions
    func readFile(file: FileName) -> String {
        guard let fileUrl = file.value() else {
            return ""
        }
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            do {
                let strQueryLog = try String(contentsOf: fileUrl, encoding: .utf8)
                return strQueryLog
            } catch {
                return ""
            }
        }
        return ""
    }
    
    func writeToFile(file: FileName, text: String) {
        guard let fileUrl = file.value() else {
            return
        }
        do {
            try text.write(to: fileUrl, atomically: true, encoding: String.Encoding.utf8)
        } catch {
        }
    }
    
    func isFileExiest(file: FileName) -> Bool {
        if FileManager.default.fileExists(atPath: file.value()?.path ?? "") {
            return true
        } else {
            return false
        }
    }
}

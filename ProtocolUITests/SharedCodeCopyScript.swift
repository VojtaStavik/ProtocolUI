#!/usr/bin/env xcrun -sdk macosx swift

// This script is run in the "Run Script" phase and it copies the shared test code
// to all test cases

import Foundation

let fileManager = NSFileManager.defaultManager()
let rootPath = Process.arguments[1]

if let paths = fileManager.subpathsAtPath(rootPath) {
    
    let sourcePath = rootPath + "/SharedTestCode.swift"
    
    do {

        let sharedCode = try String(contentsOfFile: sourcePath)

        print(sharedCode)
        
        for path in paths.filter({ $0.hasSuffix("Test.swift") }) {

            do {

                let fullPath = rootPath + "/\(path)"
                
                let fileContent = try String(contentsOfFile:fullPath)
                
                let components = fileContent.componentsSeparatedByString("//~~~**~~~")
                
                if components.count == 3 {
                    
                    let newContent = components[0] + sharedCode + components[2]
                    
                    do {
                        
                        try newContent.writeToFile(fullPath, atomically: true, encoding: NSUTF8StringEncoding)
                    }
                }
            }
            
        }

    }
    
    catch {
        
        print("ERROR: ........... ")
    }
    
    
}


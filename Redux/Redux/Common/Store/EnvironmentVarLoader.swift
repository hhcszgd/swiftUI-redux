//
//  EnvironmentVarLoader.swift
//  Redux
//
//  Created by hhcszgd on 2024/5/25.
//

import Foundation

struct EnvironmentVarLoader {
    func testCustomerMacro() {
        #if MacroOfDev
        print("this is dev macro ")
        #else
        print("none dev macro ")
        #endif
        
        #if MacroOfRelease
        print("this is prod macro ")
        #else
        print("none prod macro ")
        #endif
    }
    
    func testCustomerVar() {
        let apiHost = Bundle.main.infoDictionary?["APHost"]
        let deployStage = Bundle.main.infoDictionary?["DeployStage"]
        print("apiHost:\(apiHost)")
        print("deployStage:\(deployStage)")
    }
}

//
//  Log.DataModel.swift
//  BitUncle
//
//  Created by Eugène Peschard on 11/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import StanwoodCore

enum Log {
    
    struct DataModel: Typeable, Codable {
        
        let chunk: String
        let position: Int
        
        private enum CodingKeys: String, CodingKey {
            case chunk
            case position
        }
        
        static func ==(lhs: DataModel, rhs: DataModel) -> Bool {
            return lhs.position == rhs.position
        }
        
    }
    
}

/*
 {
 "expiring_raw_log_url": "https://bitrise-build-log-archives-production.s3.amazonaws.com/build-logs-v2/669403bffbe35909/3247e2920496e846/2194500/3247e2920496e846.log?X-Amz-Algorithm=AWS4-HMAC-SHA256\u0026X-Amz-Content-Sha256=UNSIGNED-PAYLOAD\u0026X-Amz-Credential=AKIAIV2YZWMVCNWNR2HA%2F20181107%2Fus-east-1%2Fs3%2Faws4_request\u0026X-Amz-Date=20181107T162643Z\u0026X-Amz-Expires=600\u0026X-Amz-SignedHeaders=host\u0026X-Amz-Signature=2c45a8afdc45e97ddcf68d294ce93fb8c1927e7d5fb909a13fe226ebcd4cc14f",
 "generated_log_chunks_num": 6,
 "is_archived": true,
 "log_chunks": [
 {
 "chunk": "\n  ██████╗ ██╗████████╗██████╗ ██╗███████╗███████╗\n  ██╔══██╗██║╚══██╔══╝██╔══██╗██║██╔════╝██╔════╝\n  ██████╔╝██║   ██║   ██████╔╝██║███████╗█████╗\n  ██╔══██╗██║   ██║   ██╔══██╗██║╚════██║██╔══╝\n  ██████╔╝██║   ██║   ██║  ██║██║███████║███████╗\n  ╚═════╝ ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝\n\n\u001b[32;1mVersion: 1.6.1\u001b[0m\n\n\u001b[34mINFO\u001b[0m[15:47:21] \u001b[33;1mbitrise runs in CI mode\u001b[0m           \n\u001b[34mINFO\u001b[0m[15:47:21] \u001b[32;1mRunning workflow:\u001b[0m primary         \n\n\u001b[34;1mSwitching to workflow:\u001b[0m primary\n\n",
 "position": 0
 },
 {
 "chunk": "+------------------------------------------------------------------------------+\n| (0) activate-ssh-key@3.1.1                                                   |\n+------------------------------------------------------------------------------+\n| id: activate-ssh-key                                                         |\n| version: 3.1.1                                                               |\n| collection: https://github.com/bitrise-io/bitrise-steplib.git                |\n| toolkit: bash                                                                |\n| time: 2017-05-30T15:47:26Z                                                   |\n+------------------------------------------------------------------------------+\n|                                                                              |\n|                                                                              |\n+---+---------------------------------------------------------------+----------+\n| \u001b[34;1m-\u001b[0m | \u001b[34;1mactivate-ssh-key@3.1.1\u001b[0m                                        | 2.32 sec |\n+---+---------------------------------------------------------------+----------+\n\n                                          ▼\n\n\u001b[33mWARN\u001b[0m[15:47:26] The step's (activate-ssh-key@3.1.1) Run-If expression evaluated to false - skipping \n\u001b[34mINFO\u001b[0m[15:47:26] The Run-If expression was: \u001b[34;1m\u001b[0m \n",
 "position": 1
 },
 {
 "chunk": "+------------------------------------------------------------------------------+\n| (1) git-clone@3.4.3                                                          |\n+------------------------------------------------------------------------------+\n| id: git-clone                                                                |\n| version: 3.4.3                                                               |\n| collection: https://github.com/bitrise-io/bitrise-steplib.git                |\n| toolkit: go                                                                  |\n| time: 2017-05-30T15:47:27Z                                                   |\n+------------------------------------------------------------------------------+\n|                                                                              |\n\u001b[34mINFO\u001b[0m[15:47:27] Start installing (golang) with apt-get       \n\u001b[34mINFO\u001b[0m[15:47:27]  * \u001b[32;1m[OK]\u001b[0m Step dependency (go) installed, available. \n",
 "position": 2
 },
 {
 "chunk": "\n\u001b[34;1mGit Clone Configs:\u001b[0m\n- CloneIntoDir: /bitrise/src\n- RepositoryURL: https://github.com/bitrise-samples/sample-apps-android-sdk22.git\n\u001b[34;1mGit Checkout Configs:\u001b[0m\n- Commit: \n- Tag: \n- Branch: master\n- CloneDepth: \n\u001b[34;1mGit Pull Request Configs:\u001b[0m\n- PullRequestURI: \n- PullRequestID: \n- BranchDest: \n- PullRequestMergeBranch: \n- ResetRepository: No\n\u001b[34;1mBitrise Build Configs:\u001b[0m\n- BuildURL: https://www.bitrise.io/build/3247e2920496e846\n- BuildAPIToken: XtFWIhNx22MMMA6DcPXBGw\n\n\u001b[34;1mGit clone repository\u001b[0m\n=\u003e git \"init\"\n=\u003e git \"remote\" \"add\" \"origin\" \"https://github.com/bitrise-samples/sample-apps-android-sdk22.git\"\n=\u003e git \"fetch\"\n",
 "position": 3
 },
 {
 "chunk": "=\u003e git \"checkout\" \"master\"\n=\u003e git \"submodule\" \"update\" \"--init\" \"--recursive\"\n\u001b[34;1mExporting git logs\u001b[0m\n=\u003e GIT_CLONE_COMMIT_HASH\n   value: b4e7cad230e3fc2f2f84dbb455c7ac7f89a3a18b\n\n=\u003e GIT_CLONE_COMMIT_MESSAGE_SUBJECT\n   value: downgrade to com.android.tools.build:gradle:2.1.0\n\n=\u003e GIT_CLONE_COMMIT_MESSAGE_BODY\n   value: \n\n=\u003e GIT_CLONE_COMMIT_AUTHOR_NAME\n   value: Viktor Benei\n\n=\u003e GIT_CLONE_COMMIT_AUTHOR_EMAIL\n   value: viktor.benei@gmail.com\n\n=\u003e GIT_CLONE_COMMIT_COMMITER_NAME\n   value: GitHub\n\n=\u003e GIT_CLONE_COMMIT_COMMITER_EMAIL\n   value: noreply@github.com\n\n\u001b[32;1mSuccess\u001b[0m\n|                                                                              |\n+---+---------------------------------------------------------------+----------+\n| \u001b[32;1m✓\u001b[0m | \u001b[32;1mgit-clone@3.4.3\u001b[0m                                               | 8.77 sec |\n+---+---------------------------------------------------------------+----------+\n\n                                          ▼\n\n+------------------------------------------------------------------------------+\n| (2) Sleep                                                                    |\n+------------------------------------------------------------------------------+\n| id: script                                                                   |\n| version: 1.1.3                                                               |\n| collection: https://github.com/bitrise-io/bitrise-steplib.git                |\n| toolkit: bash                                                                |\n| time: 2017-05-30T15:47:35Z                                                   |\n+------------------------------------------------------------------------------+\n|                                                                              |\n",
 "position": 4
 },
 {
 "chunk": "+ sleep 30\n",
 "position": 5
 }
 ],
 "timestamp": null
 }
 */

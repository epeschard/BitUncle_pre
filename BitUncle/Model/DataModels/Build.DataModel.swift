//
//  Build.DataModel.swift
//  BitUncle
//
//  Created by Eugène Peschard on 10/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import StanwoodCore

extension Build {
    
    struct DataModel: Typeable, Codable {
        var abortReason: String?
        var branch: String?
        var buildNumber: Int
        var commitHash: String?
        var commitMessage: String?
        var commitViewUrl: String?
        var environmentPrepareFinishedAt: String
        var finishedAt: String?
        var isOnHold: Bool
        var originalBuildParams: OriginalBuildParameters
        var pullRequestId: Int?
        var pullRequestTargetBranch: String?
        var pullRequestViewUrl: String?
        var slug: String
        var stackConfigType: String
        var stackIdentifier: String
        var startedOnWorkerAt: String?
        var status: Int
        var statusText: String
        var tag: String?
        var triggeredAt: String
        var triggeredBy: String?
        var triggeredWorkflow: String
        
        static func ==(lhs: DataModel, rhs: DataModel) -> Bool {
            return lhs.slug == rhs.slug
        }
    }
    
    struct OriginalBuildParameters: Codable {
        let branch: String
        let branchDest: String?
        let commitHash: String?
        let commitMessage: String?
        let commitPaths: [[String: [String?]]]?
        let diffUrl: String?
        let pullRequestHeadBranch :String?
        let pullRequestId :Int?
        let pullRequestMergeBranch :String?
        let pullRequestRepositoryUrl :String?
        let workflowId: String?
    }
    
}


/*
 {
 "abort_reason": null,
 "branch": "master",
 "build_number": 80,
 "commit_hash": null,
 "commit_message": null,
 "commit_view_url": null,
 "environment_prepare_finished_at": null,
 "finished_at": null,
 "is_on_hold": false,
 "original_build_params": {
 "branch": "master",
 "workflow_id": "primary"
 },
 "pull_request_id": 0,
 "pull_request_target_branch": null,
 "pull_request_view_url": null,
 "slug": "319f2d6b620b5cbe",
 "stack_config_type": "standard1",
 "stack_identifier": "linux-docker-android",
 "started_on_worker_at": null,
 "status": 0,
 "status_text": "in-progress",
 "tag": null,
 "triggered_at": "2018-11-07T16:26:38Z",
 "triggered_by": "bitrise_api_doc",
 "triggered_workflow": "primary"
 }
 */

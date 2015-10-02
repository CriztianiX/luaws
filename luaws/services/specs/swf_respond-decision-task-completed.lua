-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["taskToken"] = "";
	["executionContext"] = "";
	["decisions"] = {
		[1] = {
			["signalExternalWorkflowExecutionDecisionAttributes"] = {
				["workflowId"] = "";
				["control"] = "";
				["input"] = "";
				["runId"] = "";
				["signalName"] = "";
			};
			["failWorkflowExecutionDecisionAttributes"] = {
				["details"] = "";
				["reason"] = "";
			};
			["completeWorkflowExecutionDecisionAttributes"] = {
				["result"] = "";
			};
			["cancelTimerDecisionAttributes"] = {
				["timerId"] = "";
			};
			["scheduleLambdaFunctionDecisionAttributes"] = {
				["id"] = "";
				["startToCloseTimeout"] = "";
				["name"] = "";
				["input"] = "";
			};
			["scheduleActivityTaskDecisionAttributes"] = {
				["startToCloseTimeout"] = "";
				["activityId"] = "";
				["activityType"] = {
					["name"] = "";
					["version"] = "";
				};
				["heartbeatTimeout"] = "";
				["scheduleToStartTimeout"] = "";
				["control"] = "";
				["input"] = "";
				["scheduleToCloseTimeout"] = "";
				["taskPriority"] = "";
				["taskList"] = {
					["name"] = "";
				};
			};
			["decisionType"] = "";
			["requestCancelExternalWorkflowExecutionDecisionAttributes"] = {
				["workflowId"] = "";
				["runId"] = "";
				["control"] = "";
			};
			["requestCancelActivityTaskDecisionAttributes"] = {
				["activityId"] = "";
			};
			["startTimerDecisionAttributes"] = {
				["startToFireTimeout"] = "";
				["control"] = "";
				["timerId"] = "";
			};
			["recordMarkerDecisionAttributes"] = {
				["markerName"] = "";
				["details"] = "";
			};
			["cancelWorkflowExecutionDecisionAttributes"] = {
				["details"] = "";
			};
			["continueAsNewWorkflowExecutionDecisionAttributes"] = {
				["executionStartToCloseTimeout"] = "";
				["lambdaRole"] = "";
				["workflowTypeVersion"] = "";
				["tagList"] = {
					[1] = "";
				};
				["taskStartToCloseTimeout"] = "";
				["input"] = "";
				["taskPriority"] = "";
				["taskList"] = {
					["name"] = "";
				};
				["childPolicy"] = "";
			};
			["startChildWorkflowExecutionDecisionAttributes"] = {
				["workflowId"] = "";
				["executionStartToCloseTimeout"] = "";
				["lambdaRole"] = "";
				["tagList"] = {
					[1] = "";
				};
				["childPolicy"] = "";
				["workflowType"] = {
					["name"] = "";
					["version"] = "";
				};
				["control"] = "";
				["input"] = "";
				["taskPriority"] = "";
				["taskStartToCloseTimeout"] = "";
				["taskList"] = {
					["name"] = "";
				};
			};
		};
	};
}
return obj1

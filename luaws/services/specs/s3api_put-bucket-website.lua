-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["Bucket"] = "";
	["ContentMD5"] = "";
	["WebsiteConfiguration"] = {
		["ErrorDocument"] = {
			["Key"] = "";
		};
		["IndexDocument"] = {
			["Suffix"] = "";
		};
		["RoutingRules"] = {
			[1] = {
				["Condition"] = {
					["HttpErrorCodeReturnedEquals"] = "";
					["KeyPrefixEquals"] = "";
				};
				["Redirect"] = {
					["ReplaceKeyPrefixWith"] = "";
					["Protocol"] = "";
					["HttpRedirectCode"] = "";
					["ReplaceKeyWith"] = "";
					["HostName"] = "";
				};
			};
		};
		["RedirectAllRequestsTo"] = {
			["Protocol"] = "";
			["HostName"] = "";
		};
	};
}
return obj1

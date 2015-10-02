-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["Bucket"] = "";
	["LifecycleConfiguration"] = {
		["Rules"] = {
			[1] = {
				["Transition"] = {
					["Days"] = 0;
					["StorageClass"] = "";
				};
				["Prefix"] = "";
				["NoncurrentVersionExpiration"] = {
					["NoncurrentDays"] = 0;
				};
				["Expiration"] = {
					["Days"] = 0;
				};
				["NoncurrentVersionTransition"] = {
					["NoncurrentDays"] = 0;
					["StorageClass"] = "";
				};
				["ID"] = "";
				["Status"] = "";
			};
		};
	};
	["ContentMD5"] = "";
}
return obj1

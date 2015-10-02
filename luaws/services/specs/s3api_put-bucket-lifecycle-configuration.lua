-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["LifecycleConfiguration"] = {
		["Rules"] = {
			[1] = {
				["NoncurrentVersionExpiration"] = {
					["NoncurrentDays"] = 0;
				};
				["Prefix"] = "";
				["NoncurrentVersionTransitions"] = {
					[1] = {
						["NoncurrentDays"] = 0;
						["StorageClass"] = "";
					};
				};
				["Expiration"] = {
					["Days"] = 0;
				};
				["ID"] = "";
				["Transitions"] = {
					[1] = {
						["Days"] = 0;
						["StorageClass"] = "";
					};
				};
				["Status"] = "";
			};
		};
	};
	["Bucket"] = "";
}
return obj1

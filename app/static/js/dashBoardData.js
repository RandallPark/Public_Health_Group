
// var freqData=[
// {State:'AL',freq:{low:4786, mid:1319, high:249}}
// ,{State:'AZ',freq:{low:1101, mid:412, high:674}}
// ,{State:'CT',freq:{low:932, mid:2149, high:418}}
// ,{State:'DE',freq:{low:832, mid:1152, high:1862}}
// ,{State:'FL',freq:{low:4481, mid:3304, high:948}}
// ,{State:'GA',freq:{low:1619, mid:167, high:1063}}
// ,{State:'IA',freq:{low:1819, mid:247, high:1203}}
// ,{State:'IL',freq:{low:4498, mid:3852, high:942}}
// ,{State:'IN',freq:{low:797, mid:1849, high:1534}}
// ,{State:'KS',freq:{low:162, mid:379, high:471}}
// ];

// dashboard('#dashboard',freqData);

var freqData= [
	{
		age_started : "11 & Under",
		treatment_status:
		{"treatment_completed" : 23371,
		"treatment_incomplete" : 32410
		}
	},
	{
		age_started : "12 - 14",
		treatment_status: {
			"treatment_completed" : 82156,
			"treatment_incomplete" : 114096
		}
	},
	{
		age_started : "15 - 17",
		treatment_status: {
			"treatment_completed" : 115029,
			"treatment_incomplete" : 148584
		}
	},
	{
		age_started : "18 - 20",
		treatment_status: {
			"treatment_completed" : 80090,
			"treatment_incomplete" : 108891
		}
	},
	{
		age_started : "21 - 24",
		treatment_status: {
			"treatment_completed" : 50415,
			"treatment_incomplete" : 74736
		}
	},
	{
		age_started : "25 - 29",
		treatment_status: {
			"treatment_completed" : 33048,
			"treatment_incomplete" : 55144
		}
	},
	{
		age_started : "30 & UP",
		treatment_status: {
			"treatment_completed" : 38677,
			"treatment_incomplete" : 63039
		}
	},
	{
		age_started : "AGE ???",
		treatment_status: {
			"treatment_completed" : 9000,
			"treatment_incomplete" : 19889
		}
	}
]

dashboard('#dashboard',freqData);
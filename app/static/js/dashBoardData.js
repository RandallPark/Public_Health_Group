

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
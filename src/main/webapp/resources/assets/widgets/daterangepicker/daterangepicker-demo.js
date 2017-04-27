$(function() {
	"use strict";
	$("#daterangepicker-example").daterangepicker()
}), $(function() {
	"use strict";
	$("#daterangepicker-time").daterangepicker({
		timePicker : !0,
		timePickerIncrement : 30,
		format : "YYYY-MM-DD h:mm A"
	})
}), $(function() {
	"use strict";
	$("#daterangepicker-custom")
			.daterangepicker(
					{
						startDate : moment().subtract("days", 29),
						endDate : moment(),
						minDate : "01/01/2012",
						maxDate : "12/31/2014",
						dateLimit : {
							days : 60
						},
						showDropdowns : !0,
						showWeekNumbers : !0,
						timePicker : !1,
						timePickerIncrement : 1,
						timePicker12Hour : !0,
						ranges : {
							Today : [ moment(), moment() ],
							Yesterday : [ moment().subtract("days", 1),
									moment().subtract("days", 1) ],
							"Last 7 Days" : [ moment().subtract("days", 6),
									moment() ],
							"Last 30 Days" : [ moment().subtract("days", 29),
									moment() ],
							"This Month" : [ moment().startOf("month"),
									moment().endOf("month") ],
							"Last Month" : [
									moment().subtract("month", 1).startOf(
											"month"),
									moment().subtract("month", 1)
											.endOf("month") ]
						},
						opens : "left",
						buttonClasses : [ "btn btn-default" ],
						applyClass : "small bg-green",
						cancelClass : "small ui-state-default",
						format : "MM/DD/YYYY",
						separator : " to ",
						locale : {
							applyLabel : "Apply",
							fromLabel : "From",
							toLabel : "To",
							customRangeLabel : "Custom Range",
							daysOfWeek : [ "Su", "Mo", "Tu", "We", "Th", "Fr",
									"Sa" ],
							monthNames : [ "January", "February", "March",
									"April", "May", "June", "July", "August",
									"September", "October", "November",
									"December" ],
							firstDay : 1
						}
					},
					function(a, b) {
						console.log("Callback has been called!"), $(
								"#daterangepicker-custom span").html(
								a.format("MMMM D, YYYY") + " - "
										+ b.format("MMMM D, YYYY"))
					}), $("#daterangepicker-custom span").html(
			moment().subtract("days", 29).format("MMMM D, YYYY") + " - "
					+ moment().format("MMMM D, YYYY"))
}), $(function() {
	"use strict";
	$("#daterangepicker-custom-2")
			.daterangepicker(
					{
						startDate : moment().subtract("days", 29),
						endDate : moment(),
						minDate : "01/01/2012",
						maxDate : "12/31/2014",
						dateLimit : {
							days : 60
						},
						showDropdowns : !0,
						showWeekNumbers : !0,
						timePicker : !1,
						timePickerIncrement : 1,
						timePicker12Hour : !0,
						ranges : {
							Today : [ moment(), moment() ],
							Yesterday : [ moment().subtract("days", 1),
									moment().subtract("days", 1) ],
							"Last 7 Days" : [ moment().subtract("days", 6),
									moment() ],
							"Last 30 Days" : [ moment().subtract("days", 29),
									moment() ],
							"This Month" : [ moment().startOf("month"),
									moment().endOf("month") ],
							"Last Month" : [
									moment().subtract("month", 1).startOf(
											"month"),
									moment().subtract("month", 1)
											.endOf("month") ]
						},
						opens : "left",
						buttonClasses : [ "btn btn-default" ],
						applyClass : "small bg-green",
						cancelClass : "small ui-state-default",
						format : "MM/DD/YYYY",
						separator : " to ",
						locale : {
							applyLabel : "Apply",
							fromLabel : "From",
							toLabel : "To",
							customRangeLabel : "Custom Range",
							daysOfWeek : [ "Su", "Mo", "Tu", "We", "Th", "Fr",
									"Sa" ],
							monthNames : [ "January", "February", "March",
									"April", "May", "June", "July", "August",
									"September", "October", "November",
									"December" ],
							firstDay : 1
						}
					},
					function(a, b) {
						console.log("Callback has been called!"), $(
								"#daterangepicker-custom-2 span").html(
								a.format("MMMM D, YYYY") + " - "
										+ b.format("MMMM D, YYYY"))
					}), $("#daterangepicker-custom-2 span").html(
			moment().subtract("days", 29).format("MMMM D, YYYY") + " - "
					+ moment().format("MMMM D, YYYY"))
}), $(function() {
	"use strict";
	$("#daterangepicker-custom-1")
			.daterangepicker(
					{
						startDate : moment().subtract("days", 29),
						endDate : moment(),
						minDate : "01/01/2012",
						maxDate : "12/31/2014",
						dateLimit : {
							days : 60
						},
						showDropdowns : !0,
						showWeekNumbers : !0,
						timePicker : !1,
						timePickerIncrement : 1,
						timePicker12Hour : !0,
						ranges : {
							Today : [ moment(), moment() ],
							Yesterday : [ moment().subtract("days", 1),
									moment().subtract("days", 1) ],
							"Last 7 Days" : [ moment().subtract("days", 6),
									moment() ],
							"Last 30 Days" : [ moment().subtract("days", 29),
									moment() ],
							"This Month" : [ moment().startOf("month"),
									moment().endOf("month") ],
							"Last Month" : [
									moment().subtract("month", 1).startOf(
											"month"),
									moment().subtract("month", 1)
											.endOf("month") ]
						},
						opens : "left",
						buttonClasses : [ "btn btn-default" ],
						applyClass : "small bg-green",
						cancelClass : "small ui-state-default",
						format : "MM/DD/YYYY",
						separator : " to ",
						locale : {
							applyLabel : "Apply",
							fromLabel : "From",
							toLabel : "To",
							customRangeLabel : "Custom Range",
							daysOfWeek : [ "Su", "Mo", "Tu", "We", "Th", "Fr",
									"Sa" ],
							monthNames : [ "January", "February", "March",
									"April", "May", "June", "July", "August",
									"September", "October", "November",
									"December" ],
							firstDay : 1
						}
					},
					function(a, b) {
						console.log("Callback has been called!"), $(
								"#daterangepicker-custom-1 span").html(
								a.format("MMMM D, YYYY") + " - "
										+ b.format("MMMM D, YYYY"))
					}), $("#daterangepicker-custom-1 span").html(
			moment().subtract("days", 29).format("MMMM D, YYYY") + " - "
					+ moment().format("MMMM D, YYYY"))
});
$(document).on("ready", function() {
	$(".scrollable-nice").niceScroll({
		horizrailenabled : !1,
		cursorborder : "0",
		cursorwidth : "6px",
		cursorcolor : "#363636",
		zindex : "5555",
		autohidemode : !0,
		bouncescroll : !0,
		mousescrollstep : "40",
		scrollspeed : "100",
		background : "#cdcdcd",
		cursoropacitymax : "0.6",
		cursorborderradius : "0"
	}), $(".scrollable-nice").getNiceScroll().resize()
});
$(function() {
	var a = $(".isotope").imagesLoaded(function() {
		a.isotope({
			itemSelector : ".item",
			layoutMode : "masonry",
			masonry : {
				columnWidth : ".col-lg-2"
			}
		})
	});
	$("#filters").on(
			"click",
			"a",
			function(b) {
				var c = $(this).attr("data-filter-value");
				$("#filters a").removeClass("active"), $(this).addClass(
						"active"), a.isotope({
					filter : c
				})
			})
}), $(function() {
	$("#portfolio-grid").mixitup({
		showOnLoad : "hover_1"
	})
});
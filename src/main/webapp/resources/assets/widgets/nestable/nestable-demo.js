$(document).ready(
		function() {
			var a = function(a) {
				var b = a.length ? a : $(a.target), c = b.data("output");
				window.JSON ? c.val(window.JSON.stringify(b
						.nestable("serialize"))) : c
						.val("JSON browser support required for this demo.")
			};
			$("#nestable").nestable({
				group : 1
			}).on("change", a), $("#nestable").nestable({
				group : 1
			}).on("change", a), a($("#nestable").data("output",
					$("#nestable-output"))), a($("#nestable").data("output",
					$("#nestable-output"))), $("#nestable-menu").on(
					"click",
					function(a) {
						var b = $(a.target), c = b.data("action");
						"expand-all" === c && $(".dd").nestable("expandAll"),
								"collapse-all" === c
										&& $(".dd").nestable("collapseAll")
					}), $("#nestable").nestable()
		});
// window.onload = function() {
// 	$(document).ready(function() {
// 		$("#end_date").on("dp.hide", function(e) {
// 			var start = new Date($("#start").val());
// 			var end = new Date($("#end").val());
// 			var nb_hours = (end - start)/(60 * 60 * 1000);
// 			var total_price = nb_hours * <%= @garden.price_per_hour %>;
// 			$("#nb_hours").html(nb_hours);
// 			$("#final_price").html(total_price);
// 		});
// 	});
// }
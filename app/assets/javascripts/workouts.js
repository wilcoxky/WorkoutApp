$(document).on("page:load", function() {
	$(".ComButton").click(function() {
		if($(".comments").hasClass("hide")) {
			$(".comments").removeClass("hide");
			$(".ComButton").text("Hide Comments");
		}
		else {
			$(".comments").addClass("hide");
			$(".ComButton").text("Show Comments");
		}
	});
});
// JavaScript Document
	$(document).ready(function() {
		// get rating function
		function getRating(id){
			$.ajax({
				type: "GET",
				url: "update.php",
				data: "do=getrate&id="+id,
				cache: false,
				async: false,
				success: function(result) {
					// apply star rating to element
					$("#current-rating-"+id+"").css({ width: "" + result + "%" });
				},
				error: function(result) {
					alert("some error occured, please try again later");
				}
			});
		}
		
		// link handler
		$('.ratelinks li a').click(function(){
			// get the parent id
			var idStar = $(this).parent().parent().attr('id');
			$.ajax({
				type: "GET",
				url: "update.php",
				data: "rating="+$(this).text()+"&do=rate&id="+idStar,
				cache: false,
				async: false,
				success: function(result) {
					// remove #ratelinks element to prevent another rate
					$("#ratelinks").remove();
					// get rating after click
					getRating(idStar);
				},
				error: function(result) {
					alert("some error occured, please try again later");
				}
			});
			
		});
	});

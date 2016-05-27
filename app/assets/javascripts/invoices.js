
function update_subtotal() {
	var subtotal = 0;
	$('.price').each(function(i){
		var price = $(this).val();
		if (!isNaN(price)) subtotal += Number(price);
	});

	subtotal = subtotal.toFixed(2);
	console.log(subtotal);
	$('#subtotal').val(subtotal);

	
}

function update_price(row) {
	
	// var row = $(this).parents('.product-row');
	// var row = $('#kk'); //document.getElementById('kk');
	var price = row.find('.rate').val() * row.find('.qty').val();
	price = price.toFixed(2);
	console.log(price);
	isNaN(price) ? row.find('.price').val('NaN') : row.find('.price').val(price);
	update_subtotal();
}
 function bind() {
	$('.rate').blur(function(){
		update_price($(this).closest('#kk'))
	});
	$('.qty').blur(function(){
		update_price($(this).closest('#kk'))
	});
 }



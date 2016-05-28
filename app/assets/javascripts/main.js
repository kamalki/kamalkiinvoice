
function validate_add_products(){
 if ($("#invoice_product_ids").val() == ''){
  alert ('Please select atleast 1 product ');
  return false;
 }
 return true;
}

$(document).ready(function (){
	var f =1;

//	$("#invoice_product_ids").on('change',function(){
  //      var id=$('#invoice_product_ids').val();
    //    $.post("/render_read/" + id , null, null, "script");
       // var value=$('#test')
       // $.ajax({
         //           type: "POST",
           //         url: "/render_read/"+id,
            //        dataType: "html",
              //      success: function (data) {
                            // alert(data);
                //            dum = data;
                           // $('.item-row:last').html(data);
                            //$('.item-row:last').after('<tr class="item-row"></tr>');
                 //   }
            //});
   // });

    $('#search').keyup(function(e){ 
        var value=$('#search').val();

        if (value == "")
         {
            alert('Fill the Fields');
            e.preventDefault();
         }   
         else{
        
        $.ajax({


          type: "GET",
          url: '/invoices/index1?&voice=' + value,
          beforeSend: function (xhr) {
              xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
          },

          success: function (data) {

               $('.table-bordered').html(data);

          }
      });

         }
    });


    $('#addrow').click(function(){
        $('.item-row:last').html(dum);
        $('.item-row:last').after('<tr class="item-row"></tr>');
        $('.rate:last').after(' <input class="qty" type="text" placeholder="Number of Product"> <input class="price" type="text" placeholder="Amount"> <button type="button" <a class="btn btn-danger btn-xs delete" href="javascript:;"></a>Remove</button>');
        $('#invoice_product_ids :selected').remove();
        f=f+1;
        bind();
    });

     bind();

    $('body').on('click', '.delete', function(){
        $(this).parents('.product-row').remove();
        update_subtotal();
    });

    $('.txtDate').datepicker({
        format: 'yyyy/mm/dd'
    });

    $(".txtDate").datepicker("setDate", new Date());

    $('#menu .nav li').on('click',function(){
        $('#menu .nav li').removeClass('active');
        $(this).addClass('active');
    });

});
$(document).ready(function (){

$('.add_products').click(function(event){

   if (!validate_add_products()) {
            event.preventDefault();
        }
        else{
          var id = $("#invoice_product_ids").val();
          $.post("/render_read/" + id , null, null, "script");
        }
});
$( ".table" ).keyup(function(e) {
  var qty = $(e.target).closest("tr").find("#subtotal_quantity").val();
  var rate = $(e.target).closest("tr").find("#subtotal_rate").val();
$(e.target).closest("tr").find("#subtotal_total").val( qty*rate );
});
});
$(document).ready(function (){
$(".delete-btn").on("click", function(){
$(this).closest("tr").remove();
});

});

function validate_new_invoice(){
  if ($("#1").val() == ""){
    alert("Please Enter Name");
    return false;
  }
   if ($("#2").val() == ""){
    alert("Please Enter Telephone Number");
    return false;
  }
   if ($("#2").val() == ""){
    alert("Please Enter Email");
    return false;
  }
  return true;
}

$(document).ready(function (){

$('.btn-primary').click(function(event){
if (!validate_new_invoice()) {
            event.preventDefault();
        }
});
});
$(document).ready(function (){
$( ".table1" ).keyup(function(e) {
  var qty = $(e.target).closest("tr").find("#subtotal_custom_rate").val();
  var rate = $(e.target).closest("tr").find("#subtotal_custom_quantity").val();
$(e.target).closest("tr").find("#subtotal_custom_total").val( qty*rate );
}); 
});
$(document).ready(function (){
  $('.remove_button').click(function(event){
  $.post("remove_products" , null, null, "script");
});
});
$(document).ready(function (){
  var rate = $("#subtotal_rate").val();
  $('.link').click(function(event){
    $("#subtotal_rate").prop("disabled",false)
  });
  $( "#subtotal_rate" ).keyup(function(e) {
    var new_rate = $("#subtotal_rate").val()
   alert("You have changed rate " + new_rate);
  });
});

$( document ).ready(function() {

	$('.two1').hide();
    $('.three1').hide();
    $('.four1').hide();

    $('.two2').hide();
    $('.three2').hide();
    $('.four2').hide();

    $(".optionOne").click(function(){
	    $(".one2").show();
	    $('.two2').hide();
	    $('.three2').hide();
	    $('.four2').hide();
	});

    $(".optionTwo").click(function(){
	    $(".two2").show();
	    $('.one2').hide();
	    $('.three2').hide();
	    $('.four2').hide();
	});

    $(".optionThree").click(function(){
	    $(".three2").show();
	    $('.one2').hide();
	    $('.two2').hide();
	    $('.four2').hide();
	});

    $(".optionFour").click(function(){
	    $(".four2").show();
	    $('.one2').hide();
	    $('.three2').hide();
	    $('.two2').hide();
	});

// banner Box

	$(".optionOne1").click(function(){
	    $(".one1").show();
	    $('.two1').hide();
	    $('.three1').hide();
	    $('.four1').hide();
	});

    $(".optionTwo1").click(function(){
	    $(".two1").show();
	    $('.one1').hide();
	    $('.three1').hide();
	    $('.four1').hide();
	});

    $(".optionThree1").click(function(){
	    $(".three1").show();
	    $('.one1').hide();
	    $('.two1').hide();
	    $('.four1').hide();
	});

    $(".optionFour1").click(function(){
	    $(".four1").show();
	    $('.one1').hide();
	    $('.three1').hide();
	    $('.two1').hide();
	});

});
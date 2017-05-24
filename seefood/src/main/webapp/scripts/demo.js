
$(function(){
	
	$('.roulette').find('img').hover(function(){
		console.log($(this).height());
	});
	
	var p = {
		startCallback : function() {
			appendLogMsg('<h5>祝你中大獎!</h5>');
			$('#speed, #duration').slider('disable');
			$('#stopImageNumber').spinner('disable');
			$('.start').attr('disabled', 'true');
			$('.stop').removeAttr('disabled');
		},
		slowDownCallback : function() {
			appendLogMsg('今天手氣如何呢!?');
			$('.stop').attr('disabled', 'true');
		},
		stopCallback : function($stopElm) {
			var num = $stopElm.selector.replace( /^\D+/g, '').substring(2,3);
			var num2=parseInt(num);
			switch(num2) {
		    case 1:
		    	appendLogMsg('<h3 style="color: red;">恭喜~獲得最大獎!!<h3>');
		    	appendLogMsg('<h5 >請點擊確認領取獎品<h5>');
		        break;
		    case 2:
		    	appendLogMsg('<h3 style="color: red;">恭喜~獲得1500點!!<h3>');
		    	appendLogMsg('<h5 >請點擊確認領取獎品<h5>');
		        break;
		    case 3:
		    	appendLogMsg('<h3 style="color: red;">恭喜~獲得500點!!<h3>');
		    	appendLogMsg('<h5 >請點擊確認領取獎品<h5>');
		        break;
		    case 4:
		    	appendLogMsg('<h3 style="color: red;">恭喜~獲得300點!!<h3>');
		    	appendLogMsg('<h5 >請點擊確認領取獎品<h5>');
		        break;
		    case 5:
		    	appendLogMsg('<h3 style="color: red;">恭喜~獲得100點!!<h3>');
		    	appendLogMsg('<h5 >請點擊確認領取獎品<h5>');
		        break;
		    default:
		    	appendLogMsg('<h3 style="color: red;">恭喜~獲得50點!!<h3>');
		        appendLogMsg('<h5 >請點擊確認領取獎品<h5>');
		}
			
			$('#speed, #duration').slider('enable');
			$('#stopImageNumber').spinner('enable');
			$('.start').removeAttr('disabled');
			$('.stop').attr('disabled', 'true');
			
			
			
//			console.log($stopElm.selector.replace( /^\D+/g, '').substring(2,3));
			$.get( "/seefood/pages/bonus/GetBonus", { num: num} );
			
			
		}

	}
	var i=0;
	var rouletter = $('div.roulette');
	rouletter.roulette(p);	
	$('.stop').click(function(){
		var stopImageNumber = $('.stopImageNumber').val();
		if(stopImageNumber == "") {
			stopImageNumber = null;
		}
		rouletter.roulette('stop');	
	});
	$('.stop').attr('disabled', 'true');
	$('.start').click(function(){
		i++;
		if(i<2){
			rouletter.roulette('start');	
		}
	});

	var updateParamater = function(){
		p['speed'] = Number($('.speed_param').eq(0).text());
		p['duration'] = Number($('.duration_param').eq(0).text());
		p['stopImageNumber'] = Number($('.stop_image_number_param').eq(0).text());
		rouletter.roulette('option', p);
		
	}
	var updateSpeed = function(speed){
		$('.speed_param').text(speed);
	}
	$('#speed').slider({//決定轉速
		min: 1,
		max: 30,
		value : 10,
		slide: function( event, ui ) {
			updateSpeed(ui.value);
			updateParamater();
		}
	});
	updateSpeed($('#speed').slider('value'));

	var updateDuration = function(duration){
		$('.duration_param').text(duration);
	}
	$('#duration').slider({   //決定秒數
		min: 2,
		max: 10,
		value : 10,                     
		slide: function( event, ui ) {
			updateDuration(ui.value);
			updateParamater();
		}
	});
	updateDuration($('#duration').slider('value'));

	var updateStopImageNumber = function(stopImageNumber) {
		$('.image_sample').children().css('opacity' , 0.2);
		$('.image_sample').children().filter('[data-value="' + stopImageNumber + '"]').css('opacity' , 1);
		$('.stop_image_number_param').text(stopImageNumber);
		updateParamater();
		
		
	}
	
	
	$('#stopImageNumber').spinner({
		spin: function( event, ui ) {
			var imageNumber = ui.value;
			
			if ( ui.value > 4 ) {    
				$( this ).spinner( "value", -1 );
				imageNumber = 0;	
				updateStopImageNumber(-1);		
				return false;
			} else if ( ui.value < -1 ) {
				$( this ).spinner( "value", 4 );  
				imageNumber = 4;	 
				updateStopImageNumber(4);		 
				return false;
			}
			updateStopImageNumber(imageNumber);	
			
			
		}
	});
	$('#stopImageNumber').spinner('value', -1);   //目標初始值
	updateStopImageNumber($('#stopImageNumber').spinner('value'));		

	$('.image_sample').children().click(function(){
		var stopImageNumber = $(this).attr('data-value');
		
		$('#stopImageNumber').spinner('value', stopImageNumber);
		updateStopImageNumber(stopImageNumber);
		
	});
	
	var appendLogMsg = function(msg) {
		$('#msg')
	.append('<p class="muted">' + msg + '</p>')
	.scrollTop(100000000);

	}
});


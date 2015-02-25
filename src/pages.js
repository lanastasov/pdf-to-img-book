$(document).ready(function() {
	setTimeout(function() {
		counter = 0;
		step 	= $("img").height()+1;
		var width = $("img").width();
		$("#wrapper").css({
			'width' : width*2+4+"px"
		}); 
		
	}, 200);

	var timeout = 200; /* Timeout in milliseconds*/
    var lastKeyCode = -1;
    var timer = null;
    var number_keys = [48, 49, 50, 51, 52, 53, 54, 55, 56, 57];

	function keyCheck(event) {
		keyCode  = event.which;
		if (number_keys.indexOf(keyCode) != -1) {
			if ( lastKeyCode == -1) {
				refresh();
				lastKeyCode = keyCode;
			} else {
				clear([lastKeyCode, keyCode]);
                lastKeyCode = -1    
			}
		}
		
        event.stopPropagation(); //Other event listeners won't get the event
	};

	function refresh(){
        clearTimeout(timer);
        timer = setTimeout(reset, timeout);
    }
    function clear(array_keys){
        clearTimeout(timer);
        keyCombi(array_keys);
    }
    function reset(){
        keyCombi([lastKeyCode]);
        lastKeyCode = -1;
    }

    function keyCombi(keys){
    	
    	var keyObj = {
    		'48': '0', 
    		'49': '1',
    		'50': '2',
			'51': '3',
			'52': '4',
			'53': '5',
			'54': '6',
			'55': '7',
			'56': '8',
			'57': '9',
    	};

    	if (keys.length > 1) {
    		// console.log(".click"+a[keys[0]]+a[keys[1]])
    		window.location.href = $(".click"+keyObj[keys[0]]+keyObj[keys[1]]).attr('href');
    	} else {
    		window.location.href = $(".click"+keyObj[keys[0]]).attr('href');
    		// console.log(".click"+a[keys[0]]);
    	}
    }

	window.addEventListener("keydown", function(event){
		// backspace
		// if (event.keyCode == 8 ) {
		// 	event.preventDefault();
		// 	var s = window.location.href;
		// 	window.location.href = s.substring(0, s.lastIndexOf('/'))+"/index.html";
		// }

		keyCheck(event);
		// escape || backspace
		if (event.keyCode == 27 || event.keyCode == 8) {
			var s = window.location.href;
			s = s.substring(0, s.lastIndexOf('/'));
			window.location.href = s.substring(0, s.lastIndexOf('/'))+"/index.html";	
		}

		// pagedown
		if (event.keyCode == 34) {
			event.preventDefault();
			counter+=1;
			$(document).scrollTop(step*counter);
		}

		// pageup
		if (event.keyCode == 33) {
			event.preventDefault();
			if (counter > 0) {
				counter-=1
				$(document).scrollTop(step*counter);
			}
		}

		// if (event.keyCode == 48) {
		// 	event.preventDefault();
		// 	window.location.href = $(".click0").attr('href');
		// }
		// if (event.keyCode == 49) {
		// 	event.preventDefault();
		// 	window.location.href = $(".click1").attr('href');
		// }
		// if (event.keyCode == 50) {
		// 	event.preventDefault();
		// 	window.location.href = $(".click2").attr('href');
		// }
		// if (event.keyCode == 51) {
		// 	event.preventDefault();
		// 	window.location.href = $(".click3").attr('href');
		// }
		// if (event.keyCode == 52) {
		// 	event.preventDefault();
		// 	window.location.href = $(".click4").attr('href');
		// }
		// if (event.keyCode == 53) {
		// 	event.preventDefault();
		// 	window.location.href = $(".click5").attr('href');
		// }
		// if (event.keyCode == 54) {
		// 	event.preventDefault();
		// 	window.location.href = $(".click6").attr('href');
		// }
		// if (event.keyCode == 55) {
		// 	event.preventDefault();
		// 	window.location.href = $(".click7").attr('href');
		// }
		// if (event.keyCode == 56) {
		// 	event.preventDefault();
		// 	window.location.href = $(".click8").attr('href');
		// }
		// if (event.keyCode == 57) {
		// 	event.preventDefault();
		// 	window.location.href = $(".click9").attr('href');
		// }

		
		

	});
});
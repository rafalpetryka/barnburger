function cycleImages1(){
      var $active = $('#zdjecia1 .active');
      var $next = ($active.next().length > 0) ? $active.next() : $('#zdjecia1 img:first');
      $next.css('z-index',2);//move the next image up the pile
      $active.fadeOut(1500,function(){//fade out the top image
    $active.css('z-index',1).show().removeClass('active');//reset the z-index and unhide the image
          $next.css('z-index',3).addClass('active');//make the next image the top one
      });
    }

function cycleImages2(){
      var $active = $('#zdjecia2 .active');
      var $next = ($active.next().length > 0) ? $active.next() : $('#zdjecia2 img:first');
      $next.css('z-index',2);//move the next image up the pile
      $active.fadeOut(1500,function(){//fade out the top image
    $active.css('z-index',1).show().removeClass('active');//reset the z-index and unhide the image
          $next.css('z-index',3).addClass('active');//make the next image the top one
      });
    }

function cycleImages3(){
      var $active = $('#zdjecia3 .active');
      var $next = ($active.next().length > 0) ? $active.next() : $('#zdjecia3 img:first');
      $next.css('z-index',2);//move the next image up the pile
      $active.fadeOut(1500,function(){//fade out the top image
    $active.css('z-index',1).show().removeClass('active');//reset the z-index and unhide the image
          $next.css('z-index',3).addClass('active');//make the next image the top one
      });
    }

$(document).ready(function(){
setInterval('cycleImages1()', ran());
setInterval('cycleImages2()', ran());
setInterval('cycleImages3()', ran());
})

function ran(){
	return (2000 + Math.random()*6000);
}


(function(){
    if (window.AlipayJSBridge) {
 
        var timeoutId = 0;
        var imgTag = document.getElementsByTagName('img');
 
        for(var i = 0; i < imgTag.length; i++){
            imgTag[i].addEventListener("touchstart",function(event){
                var imgElement = event.target;
 
                imgElement.style.webkitUserSelect = 'none';
                imgElement.style.webkitTouchCallout = 'none';
 
                timeoutId = setTimeout(function() {
                    imgElement.onclick = function(ev){
                        ev.preventDefault();
                    }
                        
                    AlipayJSBridge.call('saveImage',{
                        src : imgElement.src
                    });
                }, 1000);
            }, false);
 
            imgTag[i].addEventListener("touchend",function(event){
                clearTimeout(timeoutId);
            }, false);
 
            imgTag[i].addEventListener("touchend",function(event){
                clearTimeout(timeoutId);
            }, false);
        }
    }
})();




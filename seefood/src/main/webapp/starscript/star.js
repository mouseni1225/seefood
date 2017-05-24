var num = 0;
 var star=0;
        window.onload = function () {
            var imgs = document.getElementsByTagName("img");
            for (var i = 0; i < imgs.length; i++) {　
                imgs[i].onmouseover = function () { mouseOver(this.id); };
                imgs[i].onmouseout = function () { mouseOut(this.id); };
                imgs[i].onclick = function () { Click(this.id); }
                
            }


            function mouseOver(aa) {
                if (num % 2 == 0) {
                    for (j = 0; j < aa.substr(2) ; j++) {
                        document.images[j].src = "chngstar.gif";
                        document.getElementById("ii").innerHTML = "評分中" + (aa.substr(2))+"顆星!?";
                    }
                    num = 0;
                }
            }

            function mouseOut(aa) {
                if(num%2==0){
                for (k = 4; (k + 1) >=aa.substr(2) ; k--) {
                    document.images[k].src = "star.gif";
                }
            }
            }
           
            function Click(aa) {
                num = num + 1;
                if (num % 2 != 0) {
                    for (j = 0; j < aa.substr(2) ; j++) {
                        document.images[j].src = "chngstar.gif";
                        document.getElementById("ii").innerHTML = "您給" + (aa.substr(2))+"顆星";
                        star=aa.substr(2);
                        console.log(star);
                    }
                   
                }
               
            }
            
        }
        
        
        function text(form) {
        	if(confirm("確定刪除嗎?")){
        		form.action="<c:url value='/pages/article.controller?star="+star+"'/>";
        		form.method="get";
        		form.submit();

        	}else{
        		
        		form.action="";
        		form.method=" ";
        		form.submit();
        	}
        	
        }
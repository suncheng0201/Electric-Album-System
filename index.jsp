<form action="SmartUpload.do" enctype="multipart/form-data" method="post">

<input id="img" type="file" name="file1" accept="image/*" capture="camera" onchange="showPreview(this)" style="height: 130px; width: 460px; "><br/>
<input type="submit" value="upload" style="height: 48px; width: 90px; "><br/>

<div id="preview"></div>
<br/>       
 ${result}    
</form>

</body>
<%
		String list = (String)request.getAttribute("list");
%>
<h2 align = "center"><%=list %></h2>


<script    type="text/javascript">

        var fileList=document.getElementById("preview");
     
        function showPreview(obj){
            var files = obj.files,
            img = new Image();
            if(window.URL){
                //File API
                //alert(files[0].name + "," + files[0].size/(1024*1024) + "MB");
                img.src = window.URL.createObjectURL(files[0]); //创建一个object URL，并不是你的本地路径
                img.width = 200;
                img.onload = function(e) {
                    window.URL.revokeObjectURL(this.src); //图片加载后，释放object URL
                }
                fileList.appendChild(img);           
            }
            else if(window.FileReader){
                //opera不支持createObjectURL/revokeObjectURL方法。我们用FileReader对象来处理                 
                var reader = new FileReader();
                reader.readAsDataURL(files[0]);
                reader.onload = function(e){
                   // alert(files[0].name + "," +e.total/(1024*1024) + "MB")
                    img.src = this.result;
                    img.width = 200;
                    fileList.appendChild(img);          
                }
            }
            else{
                //ie
                obj.select();
                obj.blur();
                var nfile = document.selection.createRange().text;
                document.selection.empty();
                img.src = nfile;
                img.width = 200;
                img.onload=function(){
                 //   alert(nfile+","+img.fileSize/(1024*1024) + "MB");
                }
                fileList.appendChild(img);
            }                                            
         }

    </script>

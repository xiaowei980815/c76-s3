<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    //使用数组保存图片的地址
    var imgs=["assets/img/122.gif","assets/img/125.gif","assets/img/126.gif"];
    var index=0;
    function qiehuan(){
        document.getElementById("img").src=imgs[index];
        index++;
        if(index > 2){
            index=0;
        }
    }
    setInterval("qiehuan()",3000);
</script>
<div style="z-index:999;display: block; position: fixed; right: 0px; top: 200px;">
<div id="zxd_z">
  <a><b  title="点击关闭" onclick="document.getElementById('content1').style.display='none';document.getElementById('zxd_z').style.display='none';">关闭</b></a></div>
  <div id="content1" ><a href="https://www.iqiyi.com/"><img src="${baseurl }assets/img/126.gif" height=420px width=280px id="img"></a></div>
</div>
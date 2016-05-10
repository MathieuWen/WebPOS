<html>
<head>
<script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script> 
<style>
table, tr, td{
   border: 1px solid red;
}
</style>
<script>

function delayExecute(check, proc, chkInterval){
   var x = chkInterval || 10;
   var hnd = window.setInterval(function(){
      if(check()){
         window.clearInterval(hnd);
         proc();
      }
   }, x);
}

var i = 1;
window.delayExecute(function(){
   $.getJSON('reader.js.php',{
      usrNo: i, 
      ReaderID: 1,
      timestamp: (new Date()).getTime()
   },function(data){
      var json = data.pop();
      var txt = '<tr><td>'+json.name+'</td><td>'+json.location+'</td><td>'+json.usrno+'</td><td>'+json.groupno+'</td><td>'+json.no+'</td></tr>';
      $('#content table tbody').append(txt);
   });
   return i++>10;
},function(){

}, 2000);

</script>
</head>

<body>
<div id="content">
<table>
<thead>
<tr><th>名稱</th><th>位置</th><th>卡號</th><th>組碼</th><th>卡碼</th></tr>
</thead>
<tbody></tbody>
</table>
</div>
</body>
</html>
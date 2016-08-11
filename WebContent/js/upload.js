/**
 * 2016/08/06
 */

$(document).ready(function() {
  // 初始加载是否完成
  var initLoaded = false;
  // 上传文件的参数
  var uploaded = false;
  var uploadedFile = {};

  // 加载已上传文件
  initLoad();

  // 选择文件
  $('.select-file>span:first-child').click(function(event) {
    $('#uploadFile').click();
  });

  // 文件域改变
  $('#uploadFile').change(function(event) {
    if($(this).val() != ''){
      $('.preview>.select-file').addClass('selected').removeClass('after-uploaded').removeClass('hover');
      $('.preview>img').attr('src', getObjectURL(this.files[0]));
      $('.upload-operation>.file-name').html(this.files[0].name).attr('title', this.files[0].name);
    }else {
      $('.preview>.select-file').removeClass('selected').removeClass('after-uploaded').addClass('hover');
      $('.preview>img').attr('src', '');
      // $('.preview>.select-file').html("选择文件");
    }
  });

  // 确认上传
  $('.confirm-upload').click(function(event) {
    if(!initLoaded){
      $('.file-list').removeClass('init-load');
      initLoaded = true;
    }

    var now = new Date();
    var imgSrc = $('.preview>img').attr('src');
    var fileName = $('.file-name').html();
    uploadedFile.src = imgSrc;
    uploadedFile.name = fileName;
    uploadedFile.time = getNow();
    uploaded = true;

    var form = new FormData($('#uploadForm')[0]);
    $.ajax({
        url: 'upload',
        type: 'POST',
        data: form,
        processData: false,
        contentType: false
    }).success(function(data){
      if($('#mCSB_1_container').css('top').charAt(0) === '0'){
        addUploadedFile();
      }else {
        $('.file-list').mCustomScrollbar("scrollTo", "top", {callbacks: true});
      }
    }).error(function(){
      alert('upload error!');
    });

  });

  // 取消上传
  $('.cancel').click(function(event) {
    $('#reset').click();
    $('#uploadFile').change();
  });

  // 继续选择
  $('.continue-select').click(function(event) {
    $('#uploadFile').click();
  });


  // 已上传文件中，点击列表项，查看图片
  $('.file-list').on('click', '.list-item', function(event) {
    $('.content').css('left', '-100%');
    $('.result>.header').addClass('result-show').removeClass('result-list');
    // 顶部标题栏显示图片名
    var imgName = $(this).children('.info').children('p:first-child').html();
    $('.back>span').html(imgName);
    $('.back>span').attr('title', imgName);
    // 展示图片
    var imgSrc = $(this).children('img').attr('src');
    $('.img-display>img').attr('src', imgSrc);
  });

  // 查看图片，点击顶部向左箭头，返回列表
  $('.result>.header').on('click', '.back>img', function(event) {
    $('.content').css('left', 0);
    // 更改头部显示
    $('.result>.header').addClass('result-list').removeClass('result-show');
  });

  // 在列表项中点击删除按钮
  $('.file-list').on('click', '.delete', function(event) {
    // 删除图片，并显示删除的动画
    var $item = $(this).parent().parent();

    if(!initLoaded){
      $('.file-list').removeClass('init-load');
      initLoaded = true;
    }

    $.get('delete', {fileName: $item.find('.info>p:first-child').html()}, function(data, textStatus){
      if(textStatus === 'success'){
        $item.animate({left: '-100%'}, 300, function(){
          $item.animate({height: 0}, 300, function(){
            // TODO: 删除文件
            $item.remove();
          })
        })
      }
    });

    // 阻止事件冒泡
    return false;
  });



  /***********相关功能函数***********/

  // 进入页面，加载已上传文件
  function initLoad(){
    $.getJSON('load', function(json, textStatus) {
        if(textStatus === 'success'){
          // 排序
          var result = resultSort(json);
          // 加载
          var total = json.total;
          var items = "";
          for(var i = 0; i < total; ++i){
            items += '<li class="list-item"><img src="' + json.items[result[i]].src + '" alt="logo">'
                   + '<div class="info"><p title="' +json.items[result[i]].name + '">'
                   + json.items[result[i]].name + '</p><p>'+ json.items[result[i]].time + '</p></div>'
                   + '<div class="operation"><i class="unhide icon display" title="查看图片"></i>'
                   + '<i class="trash outline icon delete" title="删除图片"></i></div></li>';
          }
          $('.file-list').html(items);
          // 自定义的滚动条
          $('.file-list').mCustomScrollbar({
            scrollInertia: 200,
            mouseWheel:{ scrollAmount: 400 },
            callbacks:{
              onTotalScrollBack: addUploadedFile
            }
          });
        }else {
          alert("error!");
        }
    });
  }

  // 增加上传文件到 已上传文件
  function addUploadedFile (){
    if(uploaded){
      var item = '<li class="list-item uploaded"><img src="' + uploadedFile.src + '" alt="logo">'
               + '<div class="info"><p title="' +uploadedFile.name + '">'
               + uploadedFile.name + '</p><p>' + uploadedFile.time + '</p></div>'
               + '<div class="operation"><i class="unhide icon display" title="查看图片"></i>'
               + '<i class="trash outline icon delete" title="删除图片"></i></div></li>';
      $('#mCSB_1_container').prepend(item);

      $('#mCSB_1_container').children('.uploaded').first().animate({height: '80px'}, 300, function(){
        $(this).animate({left: 0}, 300, function(){
          $('.preview>.select-file').addClass('after-uploaded').removeClass('selected');
        });
      });

    }
    uploaded = false;
  }

  // 对json的内容按时排序
  function resultSort(json){
    var temp;
    var result = [];
    var total = json.total;
    for(var i = 0; i < total; ++i){
      result.push(i);
    }
    // 冒泡排序
    var exchanged = false;
    for(i = 0; i < total - 1; ++i){
      exchanged = false;
      for(var j = 0; j < total - 1 - i; ++j){
        if(json.items[result[j]].time < json.items[result[j + 1]].time){
          temp = result[j];
          result[j] = result[j + 1];
          result[j + 1] = temp;
          exchanged = true;
        }
      }
      if(!exchanged) {
        break;
      }
    }
    return result;
  }

  //建立一个可存取到该file的url
  function getObjectURL(file) {
    var url = null ;
    if (window.createObjectURL != undefined) { // basic
      url = window.createObjectURL(file) ;
    } else if (window.URL != undefined) { // mozilla(firefox)
      url = window.URL.createObjectURL(file) ;
    } else if (window.webkitURL != undefined) { // webkit or chrome
      url = window.webkitURL.createObjectURL(file) ;
    }
    return url ;
  } // 上传文件的参数

  // 获取yyyy-mm-dd hh:mm:ss格式的当前时间
  function getNow(){
    var now = new Date();
    var year = now.getFullYear();
    var month = addZero(now.getMonth() + 1);
    var day = addZero(now.getDate());
    var hour = addZero(now.getHours());
    var min = addZero(now.getMinutes());
    var sec = addZero(now.getSeconds());
    return year + "-" + month + "-" + day + " " + hour + ":" + min + ":" + sec;
  }
  // 在小于10的数字前加0
  function addZero(num){
    if(num < 10){
      return "0" + num;
    }
    return num;
  }

});

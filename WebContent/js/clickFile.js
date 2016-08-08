/**
 * 2016/08/06
 */

$(document).ready(function() {

  // 自定义的滚动科
  $('.file-list').mCustomScrollbar({
		scrollInertia: 200,
		mouseWheel:{ scrollAmount: 400 }
	});

  // $('.result>button').click(function(event) {
  //   // $('.result>input').click();
  //   $('#reset').click();
  //   // 手动触发change事件
  //   $('#uploadFile').change();
  // });



  $('.select-file>span:first-child').click(function(event) {
    $('#uploadFile').click();
  });
  $('.cancel').click(function(event) {
    $('#reset').click();
    $('#uploadFile').change();
  });

  $('#uploadFile').change(function(event) {
    if($(this).val() != ''){
      $('.preview>.select-file').addClass('selected').removeClass('hover');
      $('.preview>img').attr('src', getObjectURL(this.files[0]));
      $('.upload-operation>.file-name').html(this.files[0].name).attr('title', this.files[0].name);
    }else {
      $('.preview>.select-file').removeClass('selected').addClass('hover');
      $('.preview>img').attr('src', '');
      // $('.preview>.select-file').html("选择文件");
    }
  });


  // 已上传文件中，点击列表项，查看图片
  $('.list-item').on('click', function(event) {
    $('.content').css('left', '-100%');
    $('.result>.header').addClass('result-show').removeClass('result-list');
    // 展示图片
    var imgSrc = $(this).children('img').attr('src');
    $('.img-display>img').attr('src', imgSrc);
  });

  // 查看图片，点击顶部向左箭头，返回列表
  $('.result>.header').on('click', '.back>img', function(event) {
    $('.content').css('left', '0');
    // 更改头部显示
    $('.result>.header').addClass('result-list').removeClass('result-show');
  });

  // 在列表项中点击删除按钮
  $('.delete').on('click', function(event) {
    // 删除图片，并显示删除的动画
    var $item = $(this).parent().parent();
    $item.animate({left: '-100%'}, 300, function(){
      $item.animate({height: 0}, 300, function(){
        // TODO: 删除文件
        $item.remove();
      })
    })
    // 阻止事件冒泡
    return false;
  });


});



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
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>深入使用Struts</title>
<link rel="stylesheet" href="css/icon.css">
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.min.js"></script>
<script src="js/jquery.mousewheel.min.js"></script>
<script src="js/jquery.mCustomScrollbar.min.js"></script>
<script src="js/upload.js"></script>
</head>
<body>

  <img class="logo" src="images/logo.png" alt="东莞华南设计创新院">

  <h1>Upload File Demo</h1>

  <!-- 文件上传，须设置enctype和method -->
  <div class="select-upload">
    <div class="header">
      <span><i class="desktop icon"></i>选择文件</span>
    </div>
    <form id="uploadForm" action="upload" enctype="multipart/form-data" method="post">
      <input type="file" name="uploadFile" id="uploadFile" accept="image/*">
      <button type="reset" id="reset">reset</button>
    </form>
    <div class="preview">
      <%-- 预览图片 --%>
      <img src="">

      <div class="select-file hover">

        <span>选择文件</span>
        <%-- 选择文件后的上传操作 --%>
        <div class="upload-operation">
          <span class="file-name"></span>
          <span class="confirm-upload">
            <i class="upload icon"></i>上传
          </span>
          <span class="cancel">
            <i class="remove icon"></i>取消
          </span>
        </div>
        <%-- 上传文件后的操作 --%>
        <div class="continue-operation">
          <span class="continue-select">
            <i class="upload icon"></i>继续选择
          </span>
          <span class="cancel">
            <i class="remove icon"></i>取消
          </span>
        </div>

      </div>

    </div>
  </div>


	<div class="result">
    <div class="header result-list">
      <span><i class="server icon"></i>已上传文件</span>
      <span class="back"><img src="images/back_.png" alt="返回"/><span>返回</span></span>
    </div>
    <div class="content">
      <!-- 已上传文件列表 -->
      <ul class="file-list init-load">

        <%-- <li class="list-item">
          <img src="images/test1.gif" alt="logo">
          <div class="info">
            <p>marker.png</p>
            <p>2016-08-08 13:10:10</p>
          </div>
          <div class="operation">
            <i class="unhide icon display" title="查看图片">
            </i><i class="trash outline icon delete" title="删除图片"></i>
          </div>
        </li>

        <li class="list-item">
          <img src="images/test1.gif" alt="logo">
          <div class="info">
            <p>marker.png</p>
            <p>2016-08-08 13:10:10</p>
          </div>
          <div class="operation">
            <i class="unhide icon display" title="查看图片">
            </i><i class="trash outline icon delete" title="删除图片"></i>
          </div>
        </li>

        <li class="list-item">
          <img src="images/test1.gif" alt="logo">
          <div class="info">
            <p>marker.png</p>
            <p>2016-08-08 13:10:10</p>
          </div>
          <div class="operation">
            <i class="unhide icon display" title="查看图片">
            </i><i class="trash outline icon delete" title="删除图片"></i>
          </div>
        </li>

        <li class="list-item">
          <img src="images/test1.gif" alt="logo">
          <div class="info">
            <p>marker.png</p>
            <p>2016-08-08 13:10:10</p>
          </div>
          <div class="operation">
            <i class="unhide icon display" title="查看图片">
            </i><i class="trash outline icon delete" title="删除图片"></i>
          </div>
        </li>

        <li class="list-item">
          <img src="images/test1.gif" alt="logo">
          <div class="info">
            <p>marker.png</p>
            <p>2016-08-08 13:10:10</p>
          </div>
          <div class="operation">
            <i class="unhide icon display" title="查看图片">
            </i><i class="trash outline icon delete" title="删除图片"></i>
          </div>
        </li> --%>

      </ul>
      <!-- 图片查看 -->
      <div class="img-display">
        <img src="images/loc.png" alt="华南设计创新院">
      </div>
    </div>
	</div>

</body>
</html>

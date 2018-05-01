<%@ page import="com.vansl.dto.BlogData" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: vansl
  Date: 18-4-30
  Time: 下午12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>vansl-个人网站主页${test}</title>
    <style>
        a{
            text-decoration:none;
        }

        li{
            list-style: none;
        }

        nav.top{
            background-color: #fff;
            opacity: .9;
            width:100%;
            height:50px;
            top:0;
            left:0;
            position: fixed;
            border-bottom:solid 1px #e7e7e7;
            z-index:999;
        }

        @media (max-width: 1000px) {
            nav.top{
                height:200px;
            }
        }

        nav .navbar-brand{
            float: left;
            font-size: 24px;
            color: #777;
            padding: 10px;
            height: 50px;
            margin-left: 10px;
        }

        @media (max-width: 1000px) {
            nav .navbar-brand{
                font-size: 58px;
                padding: 50px;
                height:200px;
            }
        }

        div.navbar-module{
            font-size: 24px;
            color: #777;
        }

        @media (max-width: 1000px) {
            div.navbar-module{
                font-size: 58px;
            }
        }

        .navbar-module>ul{
            float: right;
            display: block;
            margin: 0;
        }
        .navbar-module li{
            float: left;
            position: relative;
            display: block;
            margin: 0;
        }

        .navbar-module li>a{
            text-shadow: 0 1px 0 rgba(255,255,255,.25);
            height: 30px;
            padding: 10px 15px;
            display: block;
            color: #555;
        }

        @media (max-width: 1000px) {
            .navbar-module li>a{
                height: 120px;
                padding: 40px 60px;
            }
        }

        .navbar-module li.active>a{
            background-image: linear-gradient(to bottom,#ebebeb 0,#f3f3f3 100%);
            background-repeat: repeat-x;
            box-shadow: inset 0 3px 9px rgba(0,0,0,.075);
            background-color: #e7e7e7;
        }

        div.content{
            z-index: 1;
            margin: 5% 2% 10%;
        }
        
        div.category{
            float: left;
            margin-top:20px;
            margin-left: -70px;
            position: fixed;
        }

        .category li{
            margin-top: 3px;
        }
        .category ul{
            display: block;
            margin-top: 10px;
            margin-left: 5%;
            margin-bottom: 20px;

        }
        .category a{
            white-space:nowrap;
            font-size: 18px;
            border: 1px solid #ddd;
            background-color: #fff;
            color: #428bca;
        }

        @media (max-width: 1000px) {
            .category a {
                font-size: 43px;
            }
        }

        div.article{
            display: block;
            margin-left: 10%;
            margin-top:100px;
            margin-bottom: 20px;
        }

        @media (max-width: 1000px) {
            div.article{
                margin-top:300px;
                margin-left: 20%;
            }
        }

        .article-list:first-child {
            border-top-right-radius: 4px;
            border-top-left-radius: 4px;
        }

        li.article-list-item{
            border: 1px solid #ddd;
            background-color: #fff;
            cursor: pointer;
            padding: 15px 20px;
            margin-bottom: -1px;
        }

        li.article-list-item:hover{
            background-color: #EDEDED;
        }

        .article-list-item a{
            display: block;
            font-size: 21px;
            color: #428bca;
        }

        @media (max-width: 1000px) {
            .article-list-item a{
                font-size: 58px;
            }
        }

        .article-list-item a:hover{
            text-decoration: underline;
        }

    </style>
</head>

<script src="/layui/layui.js"></script>

<body>
    <nav class="top">
        <div class="navbar-brand">代码与漫谈</div>
        <div class="navbar-module">
            <ul>
                <li class="active">
                    <a href="#">博客</a>
                </li>
                <li>
                    <a href="/others">其他</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="content">
        <div class="category">

        </div>

        <div class="article">
            <ul class="article-list">
                <c:forEach var = "article" items="${articleList}" begin="0">

                    <li class="article-list-item">
                        <a href="/article/${article.id}">${article.title}</a>
                    </li>
                </c:forEach>

            </ul>
        </div>
    </div>

    <script type="text/javascript">
        layui.use('element', function(){
            var jq= layui.jquery;

            //菜单列表html
            var menu = '';

            function BuildTree(data) {
                if (data&&data.length> 0) {
                    menu += '<ul>';
                    for (var i in data) {
                        menu+= '<li><a href="/article#?type='+data[i].id+'">'+data[i].text+'</a>';
                        //如果有子节点则加上一层ul实现缩进
                        if(data[i].children){
                            BuildTree(data[i].children);
                        }
                        menu+= '</li>';
                    }
                    menu += '</ul>';
                }

            }

            jq(function () {
                BuildTree(${typeData});
                jq(".category").append(menu);

            });

        });

    </script>
</body>
</html>

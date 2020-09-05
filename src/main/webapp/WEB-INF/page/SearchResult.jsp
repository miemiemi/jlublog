<%@ page language="java" import="java.util.*" import="java.text.*" import="cap.bean.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%

String q = (String)request.getAttribute("q");
%>
<jsp:include page="../../frame/Header.jsp"></jsp:include>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=basePath%>SysCategoryList">JLU 博客</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
                <li><a href="<%=basePath%>SysCategoryList">网站首页</a></li>
            </ul>
            <c:if test="${user!=null && user.isApplied==1}">

                <ul class="nav navbar-nav">
                    <li><a href="<%=basePath%>myBlogController?userId=${user.id}">我的博客</a></li>
                </ul>

                <ul class="nav navbar-nav">
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                                            data-toggle="dropdown">博客管理<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a
                                    href="<%=basePath%>manage?userId=${user.id}"><i
                                    class="glyphicon glyphicon-cog"></i> 博文管理</a></li>
                            <li class="divider"></li>
                            <li><a
                                    href="<%=basePath%>artCmtMng?userId=${user.id}"><i
                                    class="glyphicon glyphicon-cog"></i> 评论查看</a></li>
                        </ul></li>
                </ul>

            </c:if>
            <c:choose>
                <c:when test="${user==null }">

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="<%=basePath%>entryLogin" target="_blank">登录</a></li>
                    </ul>
                </c:when>
                <c:when test="${user!=null }">

                    <div class="pull-right">
                        <ul class="nav pull-right">
                            <li class="dropdown"><a href="#" class="dropdown-toggle"
                                                    data-toggle="dropdown">欢迎，${user.userName} <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a
                                            href="<%=basePath%>Profile?userId=${user.id}&email=${user.email}"><i
                                            class="glyphicon glyphicon-cog"></i> 编辑个人信息</a></li>
                                    <c:if test="${user.isApplied==1}">

                                        <li class="divider"></li>
                                        <li><a
                                                href="<%=basePath%>selBlog?userId=${user.id}"><i
                                                class="glyphicon glyphicon-cog"></i> 编辑博客信息</a></li>
                                    </c:if>
                                    <li class="divider"></li>
                                    <li><a href="<%=basePath%>logout"><i
                                            class="glyphicon glyphicon-off"></i> 登出</a></li>
                                </ul></li>
                        </ul>
                    </div>

                </c:when>
            </c:choose>
        </div>
    </div>
    </nav>

    <div class="container">

      <div class="row">
        <div class="col-lg-8">

          <p class="lead">
			搜索关键字：
			<c:choose>
			<c:when test="${value!=null }">			
			<b><i>	${value }</i></b>
			</c:when>
			<c:otherwise>
			<c:out value="没有输入搜索内容"/>			
		    </c:otherwise>
			</c:choose>
          </p>
          <hr>
          <p class="lead">
          	搜索结果列表：
          </p>
          <c:choose>
          <c:when test="${articles!=null && fn:length(articles) >0 }">
          <c:forEach items="${articles}" var="art">         
 		  <h4>
 		  <a href="<%=basePath%>ArtCom?artId=${art.id }&userId=${user.id}" target="_blank">${art.title }</a>
 		  </h4>
 		  </c:forEach>
          </c:when>
          <c:otherwise>
          <c:out value="对不起，没有搜索到"></c:out>
          </c:otherwise>
          </c:choose>

        </div>
      </div>
    </div>
    
<jsp:include page="../../frame/Footer.jsp"></jsp:include>

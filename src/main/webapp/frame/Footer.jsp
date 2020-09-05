<%@ page language="java" import="java.util.*" import="cap.bean.*" import="cap.dao.impl.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



    <div class="container">
      <hr>
      
      <footer>
        <div class="row">
          <div class="col-lg-12">
            <p >
            Copyright &copy; 2020 &middot; UI based on Bootstrap 3 a1206198069@163.com
                                  &middot;访问人数：<%=(Integer)session.getAttribute("num") %>                           
                            
            </p>
          </div>
        </div>
      </footer>

    </div>
  
    <script src="<%=basePath %>bootstrap/js/bootstrap.js"></script>
    
  </body>
</html>

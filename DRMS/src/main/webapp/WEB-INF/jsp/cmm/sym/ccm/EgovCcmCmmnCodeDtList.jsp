<%--
  Class Name : EgovCcmCmmnCodeList.jsp
  Description : EgovCcmCmmnCodeList 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.04.01   이중호              최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이중호
    since    : 2009.04.01
--%>
<%
 /**
  * @Class Name  : EgovCcmCmmnCodeList.jsp
  * @Description : EgovCcmCmmnCodeList 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.04.01   이중호              최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2009.04.01
  *  @version 1.0
  *  @see
  *  
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js "></script>

<script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/select/1.1.2/js/dataTables.select.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.0.2/js/dataTables.responsive.min.js"></script>
<script src="js/altEditor/dataTables.altEditor.free.js"></script>

<link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
<link href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdn.datatables.net/select/1.1.2/css/select.dataTables.min.css"/> 
<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.0.2/css/responsive.dataTables.min.css"/>

<title>공통코드 목록</title>
<script type="text/javaScript" language="javascript">

	$(document).ready(function(){
            $('#userTable').DataTable({
                "ajax" : {
                	  "url" : "<c:url value='/sym/ccm/cca/EgovCcmCmmnCodeDtList.do' />",
                      "dataType": "json",
                      "type" : "POST",
                      "dataSrc": "resultList"
                },
                dom: 'Bfrtip',
                buttons: [
                  'excelHtml5',
                  'copyHtml5',
//                   {
//                       text: 'Add',
//                       name: 'add'        // DO NOT change name
//                     },
//                     {
//                       extend: 'selected', // Bind to Selected row
//                       text: 'Edit',
//                       name: 'edit'        // DO NOT change name
//                     },
//                     {
//                       extend: 'selected', // Bind to Selected row
//                       text: 'Delete',
//                       name: 'delete'      // DO NOT change name
//                    }
                ],
                "columns" : [
                    {data: "clCodeNm"},
                    {data: "codeId"},
                    {data: "codeIdNm"},
                    {data: "useAt"}
                ],
                select: 'single',     // enable single row selection
                responsive: true,     // enable responsiveness
                altEditor: true,      // Enable altEditor ****
            });
 
    });
	
</script>
</head>

<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>    
<!-- 전체 레이어 시작 -->
<div id="wrap">
    <!-- header 시작 -->
    <div id="header"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" /></div>
    <div id="topnavi"><c:import url="/sym/mms/EgovMainMenuHead.do" /></div>        
    <!-- //header 끝 --> 
    <!-- container 시작 -->
    <div id="container">
        <!-- 좌측메뉴 시작 -->
        <div id="leftmenu"><c:import url="/sym/mms/EgovMainMenuLeft.do" /></div>
        <!-- //좌측메뉴 끝 -->
            <!-- 현재위치 네비게이션 시작 -->
            <div id="content">

                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li>내부시스템관리</li>
                            <li>&gt;</li>
                            <li>코드관리</li>
                            <li>&gt;</li>
                            <li><strong>공통코드관리</strong></li>
                        </ul>
                    </div>
                </div>

                <div id="page_info"><div id="page_info_align"></div></div>                    
                <!-- table add start -->
                <div class="default_tablestyle">
                
                <table id="userTable" class="display nowrap" style="width:100%" >
				    <thead>
				        <tr>
				            <th>공통코드명</th>
				            <th>공통코드ID</th>
				            <th>USER코드명</th>
				            <th>사용여부</th>
				        </tr>
				    </thead>
					<tfoot>
			            <tr>
			                <th>공통코드명</th>
			                <th>공통코드</th>
			                <th>USER코드명</th>
			                <th>사용여부</th>
			            </tr>
			        </tfoot>
				</table>
				
                </div>

            </form>

			<form name="Form" method="post" action="<c:url value='/sym/ccm/cca/EgovCcmCmmnCodeDetail.do'/>">
			    <input type=hidden name="codeId">
			    <input type="submit" id="invisible" class="invisible"/>
			</form>

            </div>
            <!-- //content 끝 -->    
        </div>  
        <!-- //container 끝 -->
        <!-- footer 시작 -->
        <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
        <!-- //footer 끝 -->
    </div>
    <!-- //전체 레이어 끝 -->
 </body>
</html>
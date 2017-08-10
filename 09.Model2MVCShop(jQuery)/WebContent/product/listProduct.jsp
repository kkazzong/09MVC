<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--
<%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="com.model2.mvc.common.*" %>
<%@ page import="com.model2.mvc.common.util.CommonUtil" %>

<%
	List<Product> list = (List)request.getAttribute("list");
	Search search=(Search)request.getAttribute("search");
	String menu = request.getParameter("menu");
	System.out.println(menu);
	Page resultPage = (Page)request.getAttribute("resultPage");
	
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());

%>
 --%>
<html>
<head>
<title></title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
<!--
function fncGetList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
	document.detailForm.action="/product/listProduct?menu=${param.menu}"
   	document.detailForm.submit();		
}

function fncGetSearchList(currentPage) {
	var searchKeyword = document.detailForm.searchKeyword.value;
	
	if(searchKeyword == null || searchKeyword.length < 1) {
		alert("�˻�� �Է��Ͻʽÿ�");
		return;
	} else {
		fncGetList(currentPage);
	}
}

function fncGetList2(currentPage) {
	document.getElementById("searchSoldProd").value = "1";
	fncGetList(currentPage);
}

function fncDeleteProduct(currentPage) {
	if(confirm("���� �����Ͻðڽ��ϱ�?") == true) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.action="/product/deleteProduct";
		document.detailForm.submit();
	} else {
		return;
	}
	
}

-->
</script>
</head>

<body bgcolor="#ffffff" text="#000000">


<div style="width:98%; margin-left:10px;">

<!-- form name="detailForm" action="/listProduct.do?menu=<%--=menu--%>" method="post"-->
<%-- <form name="detailForm" action="/listProduct.do?menu=${param.menu}" method="post"> --%>
<form name="detailForm"  method="post">
<%-- <form name="detailForm" action="/product/listProduct/${menu}" method="post"> --%>
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				<%-- if(menu.equals("manage")) { --%>
				<c:if test="${param.menu == 'manage'}">
				<%-- <c:if test="${menu == 'manage'}"> --%>
					<td width="93%" class="ct_ttl01">��ǰ ����</td>
				<%-- } else { --%>
				</c:if>
				<c:if test="${param.menu == 'search'}">
				<%-- <c:if test="${menu == 'search'}"> --%>
					<td width="93%" class="ct_ttl01">��ǰ �����ȸ</td>
				<%-- } --%>
				</c:if>
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td></td>
		<td align="left">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<c:if test="${param.menu == 'manage'}">
				<%-- <c:if test="${menu == 'manage'}"> --%>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
					<%-- <a href="/listSale.do?menu=${param.menu}">���� ��ǰ ����</a> --%>
					<a href="/purchase/listSale?menu=${param.menu}">���� ��ǰ ����</a>
				</td>
				</c:if>
				<c:if test="${param.menu == 'search'}">
				<%-- <c:if test="${menu == 'search'}"> --%>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
						<input type="hidden" id="searchSoldProd" name="searchSoldProd" value="${search.searchSoldProd}"/>
						<a href="javascript:fncGetList2('1');">�Ǹŵ� ��ǰ ����</a>
					</td>
					<c:if test="${search.searchSoldProd == 1}">
						<%-- <a href="/listProduct.do?menu=${param.menu}&currentPage=1">�ڷ�</a> --%>
						<a href="/product/listProduct?menu=${param.menu}&currentPage=1">�ڷ�</a>
						<%-- <a href="/purchase/listProduct?${menu}/${search.currentPage}">�ڷ�</a> --%>
					</c:if>
				</c:if>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
			</tr>
		</table>
		</td>
		<td align="right">
				<select name="searchCondition" class="ct_input_g" style="width:80px" onchange="javascript:fncGetList('1')">
					<c:if test="${param.menu == 'manage'}">
					<%-- <c:if test="${menu == 'manage'}"> --%>
					<option value="0" ${!empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""} >��ǰ��ȣ</option>
					</c:if>
					<option value="1" ${!empty search.searchCondition && search.searchCondition == 1 ? "selected" : ""}>��ǰ��</option>
					<option value="2" ${!empty search.searchCondition && search.searchCondition == 2 ? "selected" : ""}>��ǰ����</option>
				</select>
			<c:if test="${search.searchCondition == 2}">
				<input type="text" name="searchKeyword"  value="${search.searchKeyword}" class="ct_input_g" style="width:80px; height:19px" />�� ~
				<input type="text" name="searchKeywordPrice"  value="${search.searchKeywordPrice}" class="ct_input_g" style="width:80px; height:19px" />��
			</c:if>
			<c:if test="${search.searchCondition < 2 || empty search.searchCondition}">
				<input type="text" name="searchKeyword"  value="${search.searchKeyword}" class="ct_input_g" style="width:200px; height:19px" />
			</c:if>
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetSearchList('1');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<!--  <td colspan="11" >��ü <%--= resultPage.getTotalCount() --%> �Ǽ�, ���� <%--= resultPage.getCurrentPage() --%> ������</td> -->
		<td colspan="11" >��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��
		<select name="sortCondition" class="ct_input_g" style="width:40px" onChange="javascript:fncGetList('1')">
			<option value="" ${!empty search.sortCondition2 ? "selected":""} >��</option>
			<option value="asc" ${!empty search.sortCondition && search.sortCondition == 'asc' ? "selected" : ""}>��~��</option>
			<option value="desc" ${!empty search.sortCondition && search.sortCondition == 'desc' ? "selected" : ""}>��~��</option>
		</select>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����
		<select name="sortCondition2" class="ct_input_g" style="width:40px" onChange="javascript:fncGetList('1')">
			<option value="" ${!empty search.sortCondition ?  "selected":""}>��</option>
			<option value="asc" ${!empty search.sortCondition2 && search.sortCondition2 == 'asc' ? "selected":"" }>������</option>
			<option value="desc" ${!empty search.sortCondition2 && search.sortCondition2 == 'desc' ? "selected":"" }>������</option>
		</select>
		</td>
		<td class="ct_line02"></td>
		<c:if test="${param.menu == 'manage'}">
		<%-- <c:if test="${menu == 'manage'}"> --%>
		<td class="ct_list_b"  width="150">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b"  width="150">����</td>	
		<td class="ct_line02"></td>
		</c:if>
		<td class="ct_list_b"  width="150">�������</td>	
		<td class="ct_line02"></td>
		
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<%--
		int no = list.size();
		for(int i = 0; i < list.size(); i++) {
			Product product = list.get(i);
			String proTranCode = product.getProTranCode();
			System.out.print(proTranCode);
	--%>
	<c:set var="i" value="0"/>
	<c:forEach var="product" items="${list}">
	<tr class="ct_list_pop">
		<!-- <td align="center"><%--= no--%></td> -->
		<c:set var="i" value="${i+1}"/>
		<c:if test="${param.menu == 'manage'}">
		<td align="center"><%-- ${i} --%>${product.prodNo}</td>
		</c:if>
		<c:if test="${param.menu == 'search'}">
		<td align="center">${i}</td>
		</c:if>
		<td></td>
		<%--if(proTranCode.equals("0")) {--%>
		
			<c:choose>
				<c:when test="${product.proTranCode == '0' or product.proTranCode == null }">
					<td align="center"><a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a></td>
					<%-- <td align="left"><a href="/product/getProduct/${product.prodNo}/${menu}">${product.prodName}</a></td> --%>
				</c:when>
		<%--} else {--%>
				<c:otherwise>
					<!-- <td align="left"><%--= product.getProdName() --%></td> -->
					<td align="center">${product.prodName}</td>
				</c:otherwise>
			</c:choose>
		<%--} --%>
		
		<td></td>
		<!-- <td align="left"><%--= product.getPrice() --%></td> -->
		<td align="center">${product.price} ��</td>
		<td></td>
		<!-- <td align="left"><%--= product.getRegDate() --%></td> -->
		<c:if test="${param.menu == 'manage'}">
		<%-- <c:if test="${menu == 'manage'}"> --%>
		<td align="center">${product.regDate}</td>
		<td></td>
		<!--  ������ư -->
	<td align="center">
	<a href="/product/deleteProduct?prodNo=${product.prodNo}"><input type="button" value="����" onclick="confirm('�����Ͻðڽ��ϱ�?')"></a>
	</td>
	<td></td>
		</c:if>
		<td align="center">
		
		${product.proTranCode}
		<c:if test="${param.menu == 'manage'}">
		<%-- <c:if test="${menu == 'manage'}"> --%>
			<c:choose>
				<c:when test="${product.proTranCode == 0 or product.proTranCode == null}">
					�Ǹ���
				</c:when>
				<c:when test="${product.proTranCode == 1}">
					<%-- ���ſϷ� <a href="/updateTranCodeByProd.do?prodNo=${product.prodNo}&tranCode=2">����ϱ�</a> --%>
					���ſϷ� <a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=2">����ϱ�</a>
				</c:when>
				<c:when test="${product.proTranCode == 2}">
					�����
				</c:when>
				<c:when test="${product.proTranCode == 3}">
					��ۿϷ�
				</c:when>
			</c:choose>
		</c:if>
		<c:if test="${param.menu == 'search' }">
		<%-- <c:if test="${menu == 'search' }"> --%>
			<c:choose>
				<c:when test="${product.proTranCode == 0 or product.proTranCode == null}">
					�Ǹ���
				</c:when>
				<c:otherwise>
					������
				</c:otherwise>
			</c:choose>
		</c:if>
		</td>	
	
	
	</tr>
	
	
	
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	
	
	<%-- } --%>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<%-- 
		<%if(resultPage.getCurrentPage() <= resultPage.getPageUnit()) { %>
				�� 
		<%} else { %>
				<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>');">��</a>
		<%} %>
		<%for(int i = resultPage.getBeginUnitPage(); i <= resultPage.getEndUnitPage(); i++) { %>
					<%-- <a href="/listUser.do?page=<%=i%>"><%=i %></a>%>
					 <a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a>	
		<%} %>
		<%if(resultPage.getEndUnitPage() >= resultPage.getMaxPage()) { %>
				��
		<%} else { %>
				<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>');">��</a>
		<%} %>
		--%>
		<c:import var="importPage" url="/common/pageNavigator.jsp" scope="application"/>
		${ importPage }
		</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>

</body>
</html> 
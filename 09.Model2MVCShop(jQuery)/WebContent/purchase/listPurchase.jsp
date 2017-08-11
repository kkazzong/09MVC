<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page import="java.util.*"  %>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="com.model2.mvc.common.*" %> --%>

<%-- <%
	List<Purchase> list = (List<Purchase>)request.getAttribute("list");
	Search search=(Search)request.getAttribute("search");
	Page resultPage = (Page)request.getAttribute("resultPage");

%> --%>
<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncGetList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();		
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<!-- <form name="detailForm" action="/listPurchase.do" method="post"> -->
<form name="detailForm" action="/purchase/listPurchase" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<%-- <td colspan="11">��ü <%= resultPage.getTotalCount() %> �Ǽ�, ���� <%= resultPage.getCurrentPage() %> ������</td> --%>
		<td colspan="11">��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">�ֹ���¥</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">�ֹ���ǰ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�ֹ��ݾ�</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<%-- <%
		int no = list.size();
		for(int i = 0; i < list.size(); i++) {
			Purchase purchase = (Purchase)list.get(i);
			String tranCode = purchase.getTranCode();
			System.out.println("::::"+tranCode);
	%> --%>
	
	<%-- <c:set var="i" value="0"/> --%>
	<c:forEach var="purchase" items="${list}">
	<%-- <c:set var="i" value="${i+1}"/> --%>
	<tr class="ct_list_pop">
		<td align="center">
			<%-- <a href="/getPurchase.do?tranNo=10022"><%=no-- %></a> --%>
			<%-- <a href="/getPurchase.do?tranNo=${purchase.tranNo}">${i}</a> --%>
			${purchase.tranNo }
		</td>
		<td></td>
		<td align="left">
			<%-- <a href="/getUser.do?userId=<%=purchase.getBuyer().getUserId() %>"><%=purchase.getBuyer().getUserId()%></a> --%>
			<%-- <a href="/getUser.do?userId=${purchase.buyer.userId}">${purchase.buyer.userId }</a> --%>
			${purchase.orderDate}
		</td>
		<td></td>
		<%-- <td align="left"><%= purchase.getBuyer().getUserName() %></td> --%>
		<%-- <td align="left">${purchase.buyer.userName }</td> --%>
		<c:choose>
			<c:when test="${purchase.tranCode == 1}">
				<%-- <td align="left"><a href="/getProduct.do?prodNo=${purchase.purchaseProd.prodNo}&menu=search&tranNo=${purchase.tranNo}">${purchase.purchaseProd.prodName}</a></td> --%>
				<td align="left"><a href="/purchase/updatePurchaseView?tranNo=${purchase.tranNo}">${purchase.purchaseProd.prodName}</a></td>
				<td></td>
			</c:when>
			<c:otherwise>
				<td align="left">${purchase.purchaseProd.prodName}</td>
			<td></td>
			</c:otherwise>
		</c:choose>
		<%-- <c:if test="${purchase.tranCode == 1}">
		<td align="left"><a href="/getProduct.do?prodNo=${purchase.purchaseProd.prodNo}&menu=search&tranNo=${purchase.tranNo}">${purchase.purchaseProd.prodName}</a></td>
		<td></td>
		</c:if>
		<c:if test="${purchase.tranCode != '1'} }">
		<td align="left">${purchase.purchaseProd.prodName}</td>
		<td></td>
		</c:if> --%>
		<%-- <td align="left"><%= purchase.getBuyer().getPhone() %></td> --%>
		<%-- <td align="left">${purchase.buyer.phone }</td> --%>
		<td align="left">${purchase.purchaseProd.price}</td>
		<td></td>
		<td align="left">
		����
		<%--
			<% 
					if(purchase.getTranCode().equals("1")) {
			%>
		
						���ſϷ�
			<%			
					} else if(tranCode.equals("2")) {
			%>
						�����
			<%  } else if(tranCode.equals("3")){ %>
						��ۿϷ�
			<%  } %>
		 --%>
		<c:choose>
			<c:when test="${purchase.tranCode == 1}">
				���ſϷ�
			</c:when>
			<c:when test="${purchase.tranCode == 2 }">
				�����
			</c:when>
			<c:when test="${purchase.tranCode == 3 }">
				��ۿϷ�
			</c:when>
		</c:choose>
		���� �Դϴ�.</td>
		<td></td>
		<c:if test="${purchase.tranCode == 2 }">
		<td align="left">
						<%-- <a href="updateTranCode.do?tranNo=${purchase.tranNo}&tranCode=3">���ǵ���</a> --%>
						<a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=3">���ǵ���</a>
		</td>
		</c:if>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<%-- <%if(resultPage.getCurrentPage() <= resultPage.getPageUnit()) { %>
				��
		<%} else { %>
				<a href="listPurchase.do?currentPage=<%=resultPage.getBeginUnitPage()-1%>">��</a>
		<%} %>
		<%for(int i = resultPage.getBeginUnitPage(); i <= resultPage.getEndUnitPage(); i++) { %>
			<a href="/listPurchase.do?currentPage=<%=i%>"><%=i %></a> 
		<%} %>
		<%if(resultPage.getEndUnitPage() < resultPage.getMaxPage()) { %>
				<a href="/listPurchase.do?currentPage=<%=resultPage.getEndUnitPage()+1%>">��</a>
		<%} else { %>
				��
		<%} %> --%>
		<c:import var="importPage" url="/common/pageNavigator.jsp"/>
		${importPage}
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>강릉대학교 통합도서관</title>
    <link rel="stylesheet" href="/resources/css/myinfo/myInfo.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/myinfo/myInfo.js"></script>
    <script src="/js/myinfo/rentalExtension.js"></script>
</head>
<body>
<jsp:include page="myinfoNavBar.jsp"/>
<div class="main-content">
    <jsp:include page="myinfoHeader.jsp"/>
    <!-- 사용자 정보 섹션 -->
    <div class="section-container">
        <div class="section-title">사용자 정보</div>
        <div class="card">
            <div class="user-info-grid">
                <div class="info-row">
                    <div class="info-col">
                        <label class="info-label">이름</label>
                        <input type="text" class="info-input" value="${user.name}" readonly>
                    </div>
                    <div class="info-col">
                        <label class="info-label">학번</label>
                        <input type="text" class="info-input" id="ExtensionuserId" value="${user.userId}" readonly>
                    </div>
                </div>
                <div class="info-row">
                    <div class="info-col">
                        <label class="info-label">생년월일</label>
                        <input type="text" class="info-input" value="${user.birth}" readonly>
                    </div>
                    <div class="info-col">
                        <label class="info-label">소속대학</label>
                        <input type="text" class="info-input" value="${user.colleges}" readonly>
                    </div>
                </div>
                <div class="info-row">
                    <div class="info-col">
                        <label class="info-label">전화번호</label>
                        <input type="text" class="info-input" value="${user.phone}">
                    </div>
                    <div class="info-col">
                        <label class="info-label">소속학과</label>
                        <input type="text" class="info-input" value="${user.departments}" readonly>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 대출 현황 섹션 -->
    <div class="section-container">
        <div class="section-title">대출 현황</div>
        <div class="card">
            <div class="loan-header">
                <div class="loan-info-box">대출 잔여 수량: ${user.rentalAvailable}권</div>
<%--                <div class="loan-info-box">연체 경과일: ${user.overDueDate}일</div>--%>
            </div>
            <div class="loan-notification">
                <span id="rentalExtensionMessage"></span>
                <button class="notification-close" onclick="closeNotification()">✕</button>
            </div>
            <div class="grid-wrapper">
                <div class="loan-grid">
                    <%
                        List<Map<String, Object>> rental = (List<Map<String, Object>>) session.getAttribute("rental");
                    %>
                    <c:forEach var="rentalq" items="${rental}">
                        <%
                            if (rental != null) {
                        %>
                        <div class="book-section">
                            <c:if test="${isOverdue}">
                            <div class="overdue-label">연체</div>
                            </c:if>
                            <% } %>
                                <div class="book-content">
                                <div class="book-title">${rentalq.bookName}</div>
                                <div class="book-date">${rentalq.rentalStartDate} ~ ${rentalq.rentalEndDate}</div>
                            </div>
                            <button class="btn-more" data-bookname="${rentalq.bookName}">더 읽을래요 →</button>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <!-- 대출/반납 이력 섹션 -->
    <div class="section-container">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px;">
            <div class="section-title" style="margin-bottom: 0;">대출/반납 이력</div>
            <div class="search-area" style="margin: 0;">
                <input type="date" class="info-input date-input" value="2024-10-11">
                <span style="color: #666;">~</span>
                <input type="date" class="info-input date-input" value="2024-10-25">
                <button class="info-input" style="width: 60px; background: white; cursor: pointer;">조회</button>
            </div>
        </div>

        <div class="card">
            <div class="loan-header">
                <div class="loan-info-box">검색결과: 2권</div>
            </div>
            <div class="grid-wrapper">
                <div class="loan-grid">
                    <div class="book-section">
                        <div class="book-content">
                            <div class="book-title">물리학I</div>
                            <div class="book-date">2024-10-11 ~ 2024-10-25</div>
                        </div>
                        <div style="display: flex; gap: 8px; margin-top: auto;">
                            <button class="btn-more"
                                    style="margin-left: 0; flex: 1; background: #4CAF50; color: white; border: none;">
                                관심도서담기
                            </button>
                            <button class="btn-more" style="flex: 1; background: #9E9E9E; color: white; border: none;">
                                도서 상세보기
                            </button>
                        </div>
                    </div>
                    <div class="book-section">
                        <div class="book-content">
                            <div class="book-title">코스모스</div>
                            <div class="book-date">2024-10-11 ~ 2024-10-25</div>
                        </div>
                        <div style="display: flex; gap: 8px; margin-top: auto;">
                            <button class="btn-more"
                                    style="margin-left: 0; flex: 1; background: #4CAF50; color: white; border: none;">
                                관심도서담기
                            </button>
                            <button class="btn-more" style="flex: 1; background: #9E9E9E; color: white; border: none;">
                                도서 상세보기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
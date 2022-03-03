<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="" method="post">
    <div>
        <label>제목</label>
        <input name="title">
    </div>
    <div>
        <label>작성자</label>
        <%-- 작성자(member table userid) session --%>
        <input type=text name="writer" value="">
    </div>
    <div>
        <label>지점</label>
        <%-- booking table spot code, spot name --%>
        <select name="spot"></select>
    </div>
      <div>
        <label>메뉴</label>
        <%-- booking table menu code, menu name --%>
        <select name="menu"></select>
    </div>
    <div>
        <label>내용</label>
        <textarea rows="5" id="content" name="content"></textarea>
    </div>
    <br>
    <button id="insert">완료</button>
</form>
</body>
</html>
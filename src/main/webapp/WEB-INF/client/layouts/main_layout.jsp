<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%--<script src="ajax/ajax_main.js"></script>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<tiles:insertAttribute name="header"/>
<main class="content-wrapper" style="height: auto;padding-bottom: 7.5px">
    <tiles:insertAttribute name="body"/>
</main>
<tiles:insertAttribute name="footer"/>


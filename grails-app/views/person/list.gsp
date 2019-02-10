<%@ page import="asia.grails.sample.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Browse miRCancer</title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="upload">Upload Data</g:link></li>
			</ul>
		</div>
		<div id="list-person" class="content scaffold-list" role="main">
			<h1>Browse miRCancer</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="mirId" title="MirId" />
						<g:sortableColumn property="cancer" title="Cancer Type" />
						<g:sortableColumn property="profile" title="Regulation" />
						<g:sortableColumn property="pubmed" title="Pubmed_References" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${personInstanceList}" status="i" var="personInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "mirId")}</g:link></td>
						<td>${fieldValue(bean: personInstance, field: "cancer")}</td>
						<td>${fieldValue (bean:personInstance, field: "profile")}</td>
						<td>${fieldValue(bean: personInstance, field: "pubmed")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${personInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
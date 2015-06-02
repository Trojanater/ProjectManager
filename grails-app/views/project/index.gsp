<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

        <nav class="navbar navbar-inverse">
        <a class="navbar-brand">Project Management</a>
        <ul class="nav navbar-inverse">
            <li class="active"><a href="${createLink(uri: '/')}">Home</a></li>
            <li><g:link action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
    </nav>
        <div id="page-body" role="main">
            <div id="list-project" class="content scaffold-list" role="main">
                <h1 style="text-align: center"><g:message code="default.list.label" args="[entityName]" /></h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:if test="${projectList}">
                    <div class="row col-lg-10" style="padding: 0 0 0 15em">


                        <table class="table table-striped">
                            <th>
                            <g:sortableColumn property="projectName" title="projectName" titleKey="table.project.name"/>
                            <g:sortableColumn property="code" title="code" titleKey="table.project.code"/>
                            <g:sortableColumn property="teamLead.fullName" title="teamLead.fullName" titleKey="table.project.lead.developer"/>
                            <g:sortableColumn property="projectManager.fullName" title="projectManager.fullName" titleKey="table.project.project.manager"/>
                            <g:sortableColumn property="deliveryDate" title="deliveryDate" titleKey="table.project.delivery.date"/>
                            <g:sortableColumn property="currentPhase" title="currentPhase" titleKey="table.project.current.phase"/>
                            <g:sortableColumn property="priority" title="priority" titleKey="table.project.priority" defaultOrder="asc"/>
                        </th>
                            <g:each in="${projectList}" var="project">
                                <tr>
                                    <td/>
                                    <td><g:link controller="project" action="show" id="${project.id}" style="color: #66afe9">${project.projectName}</g:link></td>
                                    <td>${project.code}</td>
                                    <td>${project.teamLead.firstName} ${project.teamLead.surname}</td>
                                    <td>${project.projectManager.firstName} ${project.projectManager.surname}</td>
                                    <td>${project.deliveryDate}</td>
                                    <td>${project.currentPhase}</td>
                                    <td>${project.priority}</td>
                                </tr>
                            </g:each>
                        </table>
                    </div>
                </g:if>
                <div class="pagination">
                    <g:paginate total="${projectCount ?: 0}" />
                </div>
            </div>
        </div>
    </body>
</html>
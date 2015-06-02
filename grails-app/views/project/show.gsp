<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <a class="navbar-brand">Project Management</a>
            <ul class="nav navbar-inverse">
                <li class="active"><a href="${createLink(uri: '/')}">Home</a></li>
                <li><g:link action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </nav>
        <div id="show-project" class="content scaffold-show" role="main">
            <h1 align="center"><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <if test="${project}" var="project">
                <div align="center">
                    <table style="border: none">
                        <tr>
                            <td style="text-align: right; padding: 0 0 0 2em">
                                <output class="text" style="font-weight: bold"><g:message code="show.project.name.label"/></output>
                                <output class="text" style="font-weight: bold"><g:message code="show.project.code.label"/></output>
                                <output class="text" style="font-weight: bold"><g:message code="show.project.team.lead.label"/></output>
                                <output class="text" style="font-weight: bold"><g:message code="show.project.manager.label"/></output>
                                <output class="text" style="font-weight: bold"><g:message code="show.project.delivery.date.label"/></output>
                                <output class="text" style="font-weight: bold"><g:message code="show.project.current.phase.label"/></output>
                                <output class="text" style="font-weight: bold"><g:message code="show.project.priority.label"/></output>
                            </td>
                            <td style="padding: 0 0 0 2em">
                                <output class="text" style="font-weight: bolder">${project.projectName}</output>
                                <output class="text" style="font-weight: bolder">${project.code}</output>
                                <output class="text" style="font-weight: bolder">${project.teamLead.fullName}</output>
                                <output class="text" style="font-weight: bolder">${project.projectManager.fullName}</output>
                                <output class="text" style="font-weight: bolder">${project.deliveryDate}</output>
                                <output class="text" style="font-weight: bolder">${project.currentPhase}</output>
                                <output class="text" style="font-weight: bolder">${project.priority}</output>
                            </td>
                        </tr>
                    </table>

                </div>
            </if>
            %{--<f:display bean="project" />--}%
            </ol>
            <div class="navbar navbar-inverse">
                <g:form resource="${project}" method="DELETE">
                <fieldset style="padding: 0 0 0 50em">
                    <g:link class="btn btn-lg btn-success" action="edit" resource="${project}"><g:message code="project.update.button"/></g:link>
                    <input class="btn btn-lg btn-danger" type="submit" value="${message(code: 'project.delete.button')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
            </div>
        </div>
    </body>
</html>
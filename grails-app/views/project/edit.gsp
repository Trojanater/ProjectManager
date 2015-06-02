<%@ page import="com.project.manager.CurrentPhase" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
        <div id="edit-project" class="content scaffold-edit" role="main">
            <h1 style="text-align: center"><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${project}">
            <ul class="errors" role="alert">
                <g:eachError bean="${project}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${project}" method="PUT">
                <g:hiddenField name="version" value="${project?.version}" />
                <fieldset class="form">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="col-sm-6">
                            <label style="padding: 0.5em 0 0 5em"><g:message code="add.project.name.label"/></label>
                            <label style="padding: 0.5em 0 0 5em"><g:message code="add.project.team.lead.label"/></label>
                            <label style="padding: 0.5em 0 0 5em"><g:message code="add.project.delivery.date.label"/></label>
                            <label style="padding: 0.5em 0 0 5em"><g:message code="add.project.current.phase"/></label>
                        </div>
                        <div class="col-sm-6">
                            <g:textField name="projectName" class="input-sm" required="true" value="${project.projectName}" style="width: 200px"></g:textField>
                            <g:select class="input-sm" required="true" name="teamLead" from="${teamLead}" optionKey="id" optionValue="fullName" value="${project?.teamLead.id}" style="width: 200px"/>
                            <g:datePicker type="date" class="datepicker dropdown input-sm" name="deliveryDate" required="true" value="${project.deliveryDate}" style="width: 200px"/>
                            <g:select class="input-sm" required="true" name="currentPhase" from="${com.project.manager.CurrentPhase.values()}" value="${project.currentPhase}" style="width: 200px"/>
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="col-sm-6">
                            <label style="padding: 0.5em 0 0 5em"><g:message code="add.project.code.label"/></label>
                            <label style="padding: 0.5em 0 0 5em"><g:message code="add.project.manager.label"/></label>
                            <label style="padding: 0.5em 0 0 5em"><g:message code="add.project.priority.label"/></label>
                        </div>
                        <div class="col-sm-6">
                            <g:textField name="code" class="input-sm" required="true" style="width: 200px" value="${project.code}"></g:textField>
                            <g:select class="input-sm" required="true" name="projectManager" from="${projectManager}" optionKey="id" optionValue="fullName" value="${project?.projectManager.id}" style="width: 200px"/>
                            <g:select class="input-sm" name="priority" required="true" style="width: 200px" value="${project.priority}" from="${1..(maxPriority + 1)}"></g:select>
                        </div>
                    </div>
                </div>
                %{--<fieldset class="form">--}%
                    %{--<f:all bean="project"/>--}%
                </fieldset>
                <br/>
                <div class="navbar navbar-inverse">
                    <fieldset style="padding: 0 0 0 60em">
                        <input class="btn btn-lg btn-success" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    </fieldset>
                </div>
            </g:form>
        </div>
    </body>
</html>

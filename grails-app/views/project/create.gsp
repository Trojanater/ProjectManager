<%@ page import="com.project.manager.Project; com.project.manager.CurrentPhase; com.project.manager.ProjectMember" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <a class="navbar-brand">Project Management</a>
            <ul class="nav navbar-inverse">
                <li class="active"><a href="${createLink(uri: '/')}">Home</a></li>
                <li><g:link action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </nav>
        <div id="create-project" class="content scaffold-create" role="main">
            <h1 style="text-align: center"><g:message code="default.create.label" args="[entityName]" /></h1>
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
            <g:form action="save">
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
                            <g:select class="input-sm" required="true" name="teamLead" from="${teamLead}" optionKey="id" optionValue="fullName" style="width: 200px"/>
                            <g:datePicker type="date" class="datepicker dropdown input-sm" name="deliveryDate" required="true" value="${project.deliveryDate}" style="width: 200px"/>
                            <g:select class="input-sm" required="true" name="currentPhase" from="${CurrentPhase.values()}" value="${project.currentPhase}" style="width: 200px"/>
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
                            <g:select class="input-sm" required="true" name="projectManager" from="${projectManager}" optionKey="id" optionValue="fullName" style="width: 200px"/>
                            <g:select class="input-sm" name="priority" required="true" style="padding: 0 0 0 0; width: 200px;  align-content: flex-end" value="${project.priority}" from="${1..(maxPriority + 1)}"></g:select>
                        </div>
                    </div>
                </div>
                <br/>
                <fieldset class="navbar navbar-inverse">
                    <div style="padding: 0 0 0 60em">
                        <g:submitButton name="create" class="btn btn-lg btn-success" value="${message(code: "project.create.button")}"></g:submitButton>
                    </div>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>


package com.project.manager
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class ProjectController {

    def projectService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond projectService.findAllOrderByPriority(params), model:[projectCount: Project.count()]
    }

    def show(Project project) {
        respond project
    }

    def create() {
        respond new Project(params), model: [maxPriority: fetchGreatestPriority(), teamLead: fetchAllTeamLead(), projectManager : fetchAllProjectManager()]
    }

    @Transactional
    def save(Project project) {
        if (project == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (project.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond project.errors, view:'create'
            return
        }
        if(projectService.isPriorityTaken(project)){
            projectService.updateProjectPrioritiesIncrementOne(project)
        }

        project.save(failOnError:true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'project.label', default: 'Project'), project.id])
                redirect project
            }
            '*' { respond project, [status: CREATED] }
        }
    }

    def edit(Project project) {
        respond project, model: [maxPriority: fetchGreatestPriority(), teamLead: fetchAllTeamLead(), projectManager : fetchAllProjectManager()]
    }

    @Transactional
    def update(Project project) {
        if (project == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (project.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond project.errors, view:'edit'
            return
        }

        if(projectService.isPriorityTaken(project)){
            projectService.updateProjectPrioritiesIncrementOne(project)
        }
        projectService.updateProject(project)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'project.label', default: 'Project'), project.id])
                redirect project
            }
            '*'{ respond project, [status: OK] }
        }
    }

    @Transactional
    def delete(Project project) {

        if (project == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        projectService.deleteProject(project)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'project.label', default: 'Project'), project.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    private int fetchGreatestPriority(){
        return projectService.fetchGreatestPriority()
    }

    private List<ProjectMember> fetchAllTeamLead(){
        return projectService.fetchAllTeamLead()
    }

    private List<ProjectMember> fetchAllProjectManager(){
        return projectService.fetchAllProjectManager()
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

}

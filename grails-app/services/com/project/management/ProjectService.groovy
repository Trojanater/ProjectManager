package com.project.management
import com.project.manager.Project
import com.project.manager.ProjectMember
import com.project.manager.ProjectTitle
import grails.transaction.Transactional

@Transactional
class ProjectService {

    def createProject(Project project) {
        return project?.save()
    }

    def deleteProject(Project project){
        project?.delete()
    }

    def updateProject(Project project){
        project?.save()
    }

    def findAll(Map params){
        return Project.findAll(params)
    }

    def findAllOrderByPriority(Map params){
        return Project.listOrderByPriority(params)
    }

    def isPriorityTaken(Project project){
        Project p = Project.findByPriority(project.priority)
        if(p != null && p?.id != project.id){
            return true
        }
        return false
    }

    def updateProjectPrioritiesIncrementOne(Project project){
        if(isPriorityTaken(project)){
            Project.findAllByPriorityGreaterThanEquals(project.priority).each { p ->
                if(p.id != project.id){
                    ++p.priority
                    updateProject(p)
                }
            }
        }
    }

    def fetchGreatestPriority(){
        List<Project> projectList = Project.listOrderByPriority()
        if(!projectList.isEmpty()) {
            return projectList[projectList.size() - 1].priority
        }
        else {
            return 0
        }
    }

    def fetchAllTeamLead(){
        return ProjectMember.findAllByProjectTitle(ProjectTitle.TeamLead)
    }

    def fetchAllProjectManager(){
        return ProjectMember.findAllByProjectTitle(ProjectTitle.ProjectManager)
    }
}

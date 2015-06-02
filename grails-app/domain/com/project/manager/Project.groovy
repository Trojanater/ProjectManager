package com.project.manager

class Project {

    String projectName
    String code
    ProjectMember teamLead
    ProjectMember projectManager
    Date deliveryDate
    CurrentPhase currentPhase
    Integer priority

    static constraints = {
        projectName(nullable: false, blank: false)
        code(nullable: false, blank: false)
        teamLead()
        projectManager()
        deliveryDate(nullable: false)
        currentPhase(nullable: false, default:CurrentPhase.briefing)
        priority(nullable: false, min: 1)
    }
}

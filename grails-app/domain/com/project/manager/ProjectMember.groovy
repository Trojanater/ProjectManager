package com.project.manager

class ProjectMember {

    String firstName
    String surname
    String fullName
    ProjectTitle projectTitle

    static constraints = {
        firstName(nullable: false, blank: false)
        surname(nullable: false, blank: false)
        fullName(nullable: false, blank: false)
        projectTitle(nullable: false, default:ProjectTitle.None)
    }



}

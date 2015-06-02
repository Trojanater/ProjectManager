import com.project.manager.CurrentPhase
import com.project.manager.Project
import com.project.manager.ProjectMember
import com.project.manager.ProjectTitle

class BootStrap {

    def init = { servletContext ->

        new Project(projectName: "Project X",code: "projX", teamLead: new ProjectMember(firstName: "Byron", surname: "Prentice", fullName: "Byron Prentice", projectTitle: ProjectTitle.TeamLead).save(),
        projectManager: new ProjectMember(firstName: "Dave", surname: "Grohl", fullName: "Dave Grohl", projectTitle: ProjectTitle.ProjectManager).save(), deliveryDate: new Date(),
                currentPhase: CurrentPhase.briefing, priority: 1).save()
        new Project(projectName: "Project Y",code: "projY", teamLead: new ProjectMember(firstName: "Tom", surname: "Jones", fullName: "Tom Jones", projectTitle: ProjectTitle.TeamLead).save(),
        projectManager: new ProjectMember(firstName: "Daniel", surname: "Lewis", fullName: "Daniel Lewis", projectTitle: ProjectTitle.ProjectManager).save(), deliveryDate: new Date(),
                currentPhase: CurrentPhase.briefing, priority: 2).save()

        new ProjectMember(firstName: "Daniel", surname: "Lewis", fullName: "Steve Erwin-Lewis", projectTitle: ProjectTitle.TeamLead).save()
        new ProjectMember(firstName: "Daniel", surname: "Lewis", fullName: "Bob Louwry", projectTitle: ProjectTitle.ProjectManager).save()
        new ProjectMember(firstName: "Daniel", surname: "Lewis", fullName: "Candice Johnson", projectTitle: ProjectTitle.ProjectManager).save()
        new ProjectMember(firstName: "Daniel", surname: "Lewis", fullName: "Peter Parker", projectTitle: ProjectTitle.TeamLead).save()
        new ProjectMember(firstName: "Daniel", surname: "Lewis", fullName: "Clark Kent", projectTitle: ProjectTitle.TeamLead).save()
    }
    def destroy = {
    }
}

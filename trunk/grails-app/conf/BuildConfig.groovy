grails.servlet.version = "2.5"
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6

grails.project.dependency.resolution = {
    inherits("global") {
    }
    log "warn"
    checksums true

    repositories {
        inherits true 

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()

		mavenRepo "http://people.apache.org/repo/m2-snapshot-repository/"
		mavenRepo "http://repository.jboss.org/nexus/content/groups/public/"
    }
    dependencies {
		
        runtime 'mysql:mysql-connector-java:5.1.20'

    }

    plugins {
        runtime ":hibernate:$grailsVersion"
        runtime ":jquery:1.8.3"
        runtime ":resources:1.1.6"

        build ":tomcat:$grailsVersion"
		compile ':cache:1.0.0'
		
		compile ":lesscss-resources:1.3.0.3"
		
		compile (":shiro:1.1.4"){
			excludes([name:'quartz',group:'org.opensymphony.quartz'])
		}
		compile ':quartz:1.0-RC8'
		
		compile ":kickstart-with-bootstrap:0.8.9"
		compile ':joda-time:1.4'
		compile ':export:1.5'
		compile ':excel-import:1.0.0'
		compile ':mail:1.0.1'
		compile ":envers:2.1.0"
    }
}

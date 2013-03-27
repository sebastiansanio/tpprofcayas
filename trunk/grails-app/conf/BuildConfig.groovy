grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.project.war.file = "target/${appName}-${appVersion}.war"

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
		mavenRepo "http://people.apache.org/repo/m2-snapshot-repository/"
		mavenRepo "http://repository.jboss.org/nexus/content/groups/public/"
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes e.g.
		
        runtime 'mysql:mysql-connector-java:5.1.20'
		compile ('org.quartz-scheduler:quartz:2.1.5'){
			excludes "slf4j-api","c3p0","jta"
		}

    }

    plugins {
        runtime ":hibernate:$grailsVersion"
        runtime ":jquery:1.8.3"
        runtime ":resources:1.1.6"


        build ":tomcat:$grailsVersion"
		compile ':cache:1.0.0'
		
		compile ":lesscss-resources:1.3.0.3"
		compile ":shiro:1.1.4"
		compile ":kickstart-with-bootstrap:0.8.9"
		compile ':joda-time:1.4'
		compile ':export:1.5'
		compile ':excel-import:1.0.0'
		compile ':mail:1.0.1'
    }
}

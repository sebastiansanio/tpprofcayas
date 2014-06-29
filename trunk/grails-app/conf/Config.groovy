grails.config.locations = [ "classpath:mail-config.properties" ]

grails.project.groupId = appName 
grails.mime.file.extensions = true 
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
	excel:	       'application/vnd.ms-excel',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
	ods:           'application/vnd.oasis.opendocument.spreadsheet',
	pdf:           'application/pdf',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

grails.exceptionresolver.params.exclude = ['password']

grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
    }
}

log4j = {
    

	appenders {
        console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
		'null' name:'stacktrace'
		rollingFile name:"fileLog",maxFileSize: 1024*1024*10,file: "cayas.log",maxBackupIndex:5
    }

	root {
		error 'fileLog'
	}
    
}

login.attempts.max = 3 

grails.mail.host = "smtp.gmail.com"
grails.mail.port = 465
grails.mail.props = ["mail.transport.protocol":"smtps",
			 "mail.smtps.host":"smtp.gmail.com",
			 "mail.smtps.port":"465",
			 "mail.smtps.auth":"true"]

grails.config.defaults.locations = [KickstartResources]
class UrlMappings {

	static mappings = {
				

        "/"(controller: "auth",action: "login")
		
		"/$controller/$action?/$id?"{
			constraints {
				controller(matches:/^((?!(api|mobile|web)).*)$/)
		  	}
		}
		"404"(controller: "auth",action: "unauthorized")
		"403"	(view:'/_errors/403')
		"500"	(view:'/_errors/error')
		"503"	(view:'/_errors/503')
	}
}

class UrlMappings {

	static mappings = {
				

        "/"	{
			controller	= 'Auth'
			action		= { 'login' }
            view		= { 'login' }
        }
		"/$controller/$action?/$id?"{
			constraints {
				controller(matches:/^((?!(api|mobile|web)).*)$/)
		  	}
		}
		
		"403"	(view:'/_errors/403')
		"404"{
			controller = 'Auth'
			action = {'unauthorized'}
			
		}
		"500"	(view:'/_errors/error')
		"503"	(view:'/_errors/503')
	}
}
